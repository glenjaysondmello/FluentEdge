import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile/core/widgets/glass_container.dart';
import 'package:mobile/features/leaderboard/data/services/leaderboard_firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:mobile/graphql/typing/typing.mutations.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/custom_snackbar.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/result_detail_card.dart';

class TypingTestScreen extends StatefulWidget {
  final String referenceText;
  const TypingTestScreen({super.key, required this.referenceText});

  @override
  State<TypingTestScreen> createState() => _TypingTestScreenState();
}

class _TypingTestScreenState extends State<TypingTestScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  int _seconds = 60;
  Timer? _timer;
  bool _isRunning = false;
  bool _submitted = false;
  Map<String, dynamic>? _result;
  DateTime? _startTime;
  int _wpm = 0;
  double _accuracy = 100.0;
  int _prevTextLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    // Request focus for the text field as soon as the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (!_isRunning && _controller.text.isNotEmpty) {
      _startTimer();
    }

    final currentText = _controller.text;

    if (currentText.length > _prevTextLength) {
      final index = currentText.length - 1;

      if (index < widget.referenceText.length) {
        if (currentText[index] != widget.referenceText[index]) {
          HapticFeedback.mediumImpact();
        }
      }
    }
    _prevTextLength = currentText.length;

    _updateLiveStats();
  }

  void _updateLiveStats() {
    if (!_isRunning || _startTime == null) return;

    final typedText = _controller.text;
    final elapsedSeconds =
        DateTime.now().difference(_startTime!).inMilliseconds / 1000;
    if (elapsedSeconds == 0) return;

    final correctChars = _getCorrectCharCount();

    // WPM is calculated as (number of characters / 5) / time in minutes
    final wpm = (correctChars / 5) / (elapsedSeconds / 60);

    // Accuracy is (correct characters / total typed characters) * 100
    final accuracy = typedText.isEmpty
        ? 100.0
        : (correctChars / typedText.length) * 100;

    setState(() {
      _wpm = wpm.round();
      _accuracy = accuracy;
    });
  }

  int _getCorrectCharCount() {
    int correctChars = 0;
    final typedText = _controller.text;
    for (int i = 0; i < typedText.length; i++) {
      if (i < widget.referenceText.length &&
          typedText[i] == widget.referenceText[i]) {
        correctChars++;
      }
    }
    return correctChars;
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _seconds = 60;
      _startTime = DateTime.now();
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds <= 0) {
        timer.cancel();
        _submitTest();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _resetTest() {
    _timer?.cancel();
    _controller.clear();
    setState(() {
      _seconds = 60;
      _isRunning = false;
      _submitted = false;
      _result = null;
      _startTime = null;
      _wpm = 0;
      _accuracy = 100.0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  Future<void> _submitTest() async {
    _timer?.cancel();
    if (_submitted) return; // Prevent multiple submissions

    final duration = _startTime != null
        ? DateTime.now().difference(_startTime!).inSeconds.toDouble()
        : 60.0 - _seconds;

    setState(() {
      _isRunning = false;
      _submitted = true;
    });

    final client = GraphQLProvider.of(context).value;

    final mutationVariables = Variables_Mutation_SubmitTypingTest(
      referenceText: widget.referenceText,
      userText: _controller.text,
      durationSec: duration,
    );

    final result = await client.mutate(
      MutationOptions(
        document: documentNodeMutationSubmitTypingTest,
        variables: mutationVariables.toJson(),
      ),
    );

    if (!mounted) return;

    if (result.hasException) {
      debugPrint(result.exception.toString());
      customSnackbar(
        context,
        "Submission failed: ${result.exception}",
        isError: true,
      );
      // Reset submitted state so they can try again if they want
      setState(() {
        _submitted = false;
      });
    } else {
      setState(() {
        _result = result.data?['submitTypingTest'];
      });

      try {
        final leaderboardService = Provider.of<LeaderboardFirestoreService>(
          context,
          listen: false,
        );

        await leaderboardService.fetchAndUploadStats(client);
        debugPrint('Leaderboard updated after typing test');
      } catch (e) {
        debugPrint("Failed to update the leaderboard: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use GradientScaffold
    return GradientScaffold(
      title: 'Typing Test',
      body: _submitted && _result != null
          ? _buildResultView(context)
          : _buildTestView(context),
    );
  }

  // #region BUILDER WIDGETS

  /// The main view for the typing test itself.
  Widget _buildTestView(BuildContext context) {
    return Stack(
      children: [
        // Hidden textfield with zero size (so it never blocks taps)
        SizedBox(
          height: 0,
          width: 0,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: true,
            showCursor: false,
            enableSuggestions: false,
            autocorrect: false,
            style: const TextStyle(color: Colors.transparent),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),

        // UI
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStatsBar(),
              const SizedBox(height: 24),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // Force open keyboard
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: _buildReferenceTextView(),
                ),
              ),
              const SizedBox(height: 24),
              _buildActionBar(),
            ],
          ),
        ),
      ],
    );
  }

  /// The view for displaying the results after the test.
  Widget _buildResultView(BuildContext context) {
    final results = _result!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Text(
            "Your Results",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(),
          const SizedBox(height: 20),

          // Main Stats (WPM, CPM, Score)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatCard(
                icon: Icons.speed,
                title: "WPM",
                value: (results['wpm'] as num).toStringAsFixed(1),
              ).animate().fadeIn(delay: 300.ms).slideX(),
              _StatCard(
                icon: Icons.dialpad,
                title: "CPM",
                value: (results['cpm'] as num).toStringAsFixed(1),
              ).animate().fadeIn(delay: 400.ms).slideX(),
              _StatCard(
                icon: Icons.star,
                title: "Score",
                value: results['score'].toStringAsFixed(1),
              ).animate().fadeIn(delay: 500.ms).slideX(),
            ],
          ),

          const SizedBox(height: 20),

          // Accuracy Gauge
          _buildAccuracyGauge(
            (results['accuracy'] as num).toDouble(),
          ).animate().fadeIn(delay: 600.ms).scale(),

          const SizedBox(height: 20),

          // Use Core ResultDetailCard
          ResultDetailCard(
            title: "Mistakes",
            icon: Icons.warning_amber_rounded,
            children: (results['mistakes'] as List).map((m) {
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${m['error']} → ",
                      style: const TextStyle(color: AppColors.error),
                    ),
                    TextSpan(
                      text: m['correction'],
                      style: const TextStyle(color: AppColors.success),
                    ),
                  ],
                ),
              );
            }).toList(),
          ).animate().fadeIn(delay: 700.ms),

          const SizedBox(height: 12),

          // Use Core ResultDetailCard
          ResultDetailCard(
            title: "Suggestions",
            icon: Icons.lightbulb_outline,
            children: (results['suggestions'] as List)
                .map((s) => Text("• $s"))
                .toList(),
          ).animate().fadeIn(delay: 800.ms),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text("Try Again"),
            onPressed: _resetTest,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.accent.withAlpha(204),
              foregroundColor: Colors.white,
            ),
          ).animate().fadeIn(delay: 900.ms),
        ],
      ),
    );
  }

  /// The top bar showing live stats during the test.
  Widget _buildStatsBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _LiveStat(label: "WPM", value: _wpm.toString()),
        _LiveStat(label: "Time Left", value: "${_seconds}s", primary: true),
        _LiveStat(label: "Accuracy", value: "${_accuracy.toStringAsFixed(1)}%"),
      ],
    );
  }

  /// The action bar with Reset and Submit buttons.
  Widget _buildActionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.refresh, color: AppColors.textFaded, size: 28),
          onPressed: _resetTest,
        ),
        const SizedBox(width: 40),
        ElevatedButton(
          onPressed: _isRunning ? _submitTest : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent.withAlpha(204),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          ),
          child: const Text("Submit"),
        ),
      ],
    );
  }

  /// The text area showing real-time feedback.
  Widget _buildReferenceTextView() {
    final typedText = _controller.text;
    return GlassContainer(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.sourceCodePro(
              fontSize: 20,
              color: AppColors.textFaded,
            ),
            children: _generateTextSpans(typedText),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _generateTextSpans(String typedText) {
    List<TextSpan> spans = [];
    for (int i = 0; i < widget.referenceText.length; i++) {
      Color color;
      TextDecoration? decoration;
      TextDecorationStyle? decorationStyle;
      Color? decorationColor;

      if (i < typedText.length) {
        if (typedText[i] == widget.referenceText[i]) {
          color = AppColors.success;
        } else {
          color = AppColors.error;
          decoration = TextDecoration.underline;
          decorationStyle = TextDecorationStyle.wavy;
          decorationColor = AppColors.error;
        }
      } else {
        color = AppColors.textFaded;
      }

      // Add cursor indicator style
      if (i == typedText.length) {
        decoration = TextDecoration.underline;
        decorationColor = AppColors.accent;
      }

      spans.add(
        TextSpan(
          text: widget.referenceText[i],
          style: TextStyle(
            color: color,
            decoration: decoration,
            decorationStyle: decorationStyle,
            decorationColor: decorationColor,
          ),
        ),
      );
    }
    return spans;
  }

  /// The circular gauge for the results screen.
  Widget _buildAccuracyGauge(double accuracy) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 12.0,
      percent: accuracy / 100,
      center: Text(
        "${accuracy.toStringAsFixed(1)}%",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: AppColors.text,
        ),
      ),
      progressColor: AppColors.success,
      backgroundColor: AppColors.card,
      circularStrokeCap: CircularStrokeCap.round,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          "Accuracy",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppColors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // #endregion
}

// #region HELPER WIDGETS

class _LiveStat extends StatelessWidget {
  final String label;
  final String value;
  final bool primary;

  const _LiveStat({
    required this.label,
    required this.value,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: AppColors.textFaded, fontSize: 12),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: primary ? AppColors.accent : AppColors.text,
            fontSize: primary ? 28 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.accent, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: AppColors.text,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(color: AppColors.textFaded, fontSize: 14),
        ),
      ],
    );
  }
}

// #endregion
