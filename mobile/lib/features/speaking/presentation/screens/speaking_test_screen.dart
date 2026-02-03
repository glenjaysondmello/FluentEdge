import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile/core/widgets/custom_snackbar.dart';
import 'package:mobile/features/leaderboard/data/services/leaderboard_firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile/graphql/schema.graphql.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import 'package:mobile/graphql/speaking/speaking.mutations.graphql.dart';
import 'package:mobile/graphql/speaking/speaking.queries.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/result_detail_card.dart';

class SpeakingTestScreen extends StatefulWidget {
  final String referenceText;
  const SpeakingTestScreen({super.key, required this.referenceText});

  @override
  State<SpeakingTestScreen> createState() => _SpeakingTestScreenState();
}

class _SpeakingTestScreenState extends State<SpeakingTestScreen> {
  int _seconds = 60;
  Timer? _timer;
  bool _isRunning = false;

  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  String? _audioPath;

  bool _submitted = false;
  bool _isSubmitting = false;

  Map<String, dynamic>? _result;

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _closeRecorderSafely();
    super.dispose();
  }

  Future<void> _closeRecorderSafely() async {
    try {
      if (_recorder != null) {
        await _recorder!.closeRecorder();
      }
    } catch (e) {
      debugPrint('Error closing recorder: $e');
    } finally {
      _recorder = null;
    }
  }

  Future<void> _initRecorder() async {
    _recorder = FlutterSoundRecorder();
    try {
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        if (mounted) {
          customSnackbar(
            context,
            "Microphone permission not granted.",
            isError: true,
          );
        }
        return;
      }
      await _recorder!.openRecorder();
    } catch (e) {
      debugPrint('Recorder init error: $e');
      await _closeRecorderSafely();
      if (mounted) {
        customSnackbar(
          context,
          "Failed to initialize recorder.",
          isError: true,
        );
      }
    }
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _seconds = 60;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds <= 0) {
        timer.cancel();
        if (_isRecording) _stopRecordingAndSubmit();
      } else {
        if (!mounted) return;
        setState(() => _seconds--);
      }
    });
  }

  Future<void> _startRecording() async {
    if (_isRecording) return;
    if (_recorder == null) {
      await _initRecorder();
      if (_recorder == null) {
        if (mounted) {
          customSnackbar(context, 'Recorder not available.', isError: true);
        }
        return;
      }
    }

    try {
      final dir = await getTemporaryDirectory();
      _audioPath =
          '${dir.path}/recorded_speech_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder!.startRecorder(toFile: _audioPath, codec: Codec.aacMP4);
      setState(() => _isRecording = true);
      _startTimer();
    } catch (e) {
      debugPrint('Start recording failed: $e');
      if (mounted) {
        customSnackbar(context, 'Failed to start recording.', isError: true);
      }
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;
    try {
      await _recorder!.stopRecorder();
    } catch (e) {
      debugPrint('Stop recorder error: $e');
    } finally {
      _timer?.cancel();
      if (mounted) {
        setState(() {
          _isRecording = false;
          _isRunning = false;
        });
      }
    }
  }

  Future<void> _stopRecordingAndSubmit() async {
    if (!_isRecording) return;
    await _stopRecording();
    Future.delayed(const Duration(seconds: 1));
    await _submitTest();
  }

  void _resetTest() async {
    _timer?.cancel();
    setState(() {
      _seconds = 60;
      _isRunning = false;
      _submitted = false;
      _result = null;
      _isRecording = false;
      _isSubmitting = false;
    });
    if (_audioPath != null) {
      try {
        final f = File(_audioPath!);
        if (await f.exists()) {
          await f.delete();
        }
      } catch (e) {
        debugPrint('Failed to delete temp audio: $e');
      } finally {
        _audioPath = null;
      }
    }
  }

  Future<void> _submitTest() async {
    if (_submitted || _isSubmitting || _audioPath == null) return;
    setState(() => _isSubmitting = true);

    final file = File(_audioPath!);
    if (!await file.exists()) {
      setState(() => _isSubmitting = false);
      if (mounted) {
        customSnackbar(context, 'Recorded audio not found.', isError: true);
      }
      return;
    }

    try {
      final bytes = await file.readAsBytes();
      final upload = MultipartFile.fromBytes(
        'file',
        bytes,
        filename: _audioPath!.split('/').last,
        contentType: MediaType('audio', 'm4a'),
      );

      if (!mounted) return;

      final client = GraphQLProvider.of(context).value;
      final mutationVariables = Variables_Mutation_SubmitSpeakingTest(
        referenceText: widget.referenceText,
        audioFile: upload,
      );

      final mutationResultData = await client.mutate(
        MutationOptions(
          document: documentNodeMutationSubmitSpeakingTest,
          variables: mutationVariables.toJson(),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (!mounted) return;

      if (mutationResultData.hasException) {
        if (mounted) {
          customSnackbar(
            context,
            'Submit failed: ${mutationResultData.exception}',
            isError: true,
          );
        }
        setState(() {
          _isSubmitting = false;
          _submitted = false;
        });
        return;
      }

      final parsedMutationResultData = mutationResultData.data != null
          ? Mutation_SubmitSpeakingTest.fromJson(mutationResultData.data!)
          : null;

      final resultId = parsedMutationResultData?.submitSpeakingTest ?? "";
      await _pollForResults(client, resultId);

      try {
        if (await file.exists()) await file.delete();
      } catch (e) {
        debugPrint('Failed to delete uploaded file: $e');
      } finally {
        _audioPath = null;
      }
    } catch (e) {
      debugPrint('Submit error: $e');
      if (mounted) {
        customSnackbar(
          context,
          'An error occurred while submitting.',
          isError: true,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _pollForResults(GraphQLClient client, String resultId) async {
    int attempts = 0;
    bool isDone = false;

    while (!isDone && attempts < 20) {
      attempts++;
      await Future.delayed(const Duration(seconds: 3));

      try {
        final queryVariables = Variables_Query_GetResultById(
          resultId: resultId,
        );

        final result = await client.query(
          QueryOptions(
            document: documentNodeQueryGetResultById,
            variables: queryVariables.toJson(),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        );

        if (!mounted) return;

        if (result.hasException) continue;

        final resultParsed = Query_GetResultById.fromJson(result.data!);
        final data = resultParsed.getResultById;

        if (data.status == Enum_SpeakingTestStatus.COMPLETED) {
          isDone = true;
          setState(() {
            _submitted = true;
            _result = data.toJson();
          });

          try {
            final leaderboardService = Provider.of<LeaderboardFirestoreService>(
              context,
              listen: false,
            );
            await leaderboardService.fetchAndUploadStats(client);
          } catch (e) {
            debugPrint("Failed to update the leaderboard: $e");
          }
        } else if (data.status == Enum_SpeakingTestStatus.FAILED) {
          isDone = true;
          if (mounted) {
            customSnackbar(context, "Processing Failed.", isError: true);
          }
        }
      } catch (e) {
        debugPrint("Polling error: $e");
      }
    }

    if (!isDone && attempts >= 20) {
      if (mounted) {
        customSnackbar(
          context,
          "Test timed out. Check history later.",
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use GradientScaffold
    return GradientScaffold(
      title: 'Speaking Test',
      body: _submitted && _result != null
          ? _buildResultView()
          : _buildTestView(),
    );
  }

  Widget _buildTestView() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildStatsBar(),
          const SizedBox(height: 24),
          Expanded(child: _buildReferenceTextView()),
          const SizedBox(height: 24),
          _buildActionBar(),
        ],
      ),
    );
  }

  Widget _buildResultView() {
    final results = _result!;
    final scores = (results['scores'] ?? {}) as Map<String, dynamic>;
    final overall = (scores['overall'] is num)
        ? (scores['overall'] as num).toDouble()
        : 0.0;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _LiveStatCard(
                icon: Icons.record_voice_over,
                title: "Fluency",
                value: (scores['fluency'] is num)
                    ? (scores['fluency'] as num).toStringAsFixed(1)
                    : '0.0',
              ).animate().fadeIn(delay: 300.ms).slideX(),
              _LiveStatCard(
                icon: Icons.rule,
                title: "Grammar",
                value: (scores['grammar'] is num)
                    ? (scores['grammar'] as num).toStringAsFixed(1)
                    : '0.0',
              ).animate().fadeIn(delay: 400.ms).slideX(),
              _LiveStatCard(
                icon: Icons.spellcheck,
                title: "Pronunciation",
                value: (scores['pronunciation'] is num)
                    ? (scores['pronunciation'] as num).toStringAsFixed(1)
                    : '0.0',
              ).animate().fadeIn(delay: 500.ms).slideX(),
            ],
          ),
          const SizedBox(height: 20),
          _buildOverallScoreGauge(
            overall,
          ).animate().fadeIn(delay: 600.ms).scale(),
          const SizedBox(height: 20),

          // Use Core ResultDetailCard
          ResultDetailCard(
            title: "Your Transcript",
            icon: Icons.text_fields,
            children: [Text(results['transcript'] ?? '---')],
          ).animate().fadeIn(delay: 700.ms),

          const SizedBox(height: 12),

          // Use Core ResultDetailCard
          ResultDetailCard(
            title: "Mistakes",
            icon: Icons.warning_amber_rounded,
            children: (results['mistakes'] as List? ?? []).map((m) {
              final error = m?['error'] ?? '';
              final correction = m?['correction'] ?? '';
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "$error → ",
                      style: const TextStyle(color: AppColors.error),
                    ),
                    TextSpan(
                      text: correction,
                      style: const TextStyle(color: AppColors.success),
                    ),
                  ],
                ),
              );
            }).toList(),
          ).animate().fadeIn(delay: 800.ms),

          const SizedBox(height: 12),

          // Use Core ResultDetailCard
          ResultDetailCard(
            title: "Suggestions",
            icon: Icons.lightbulb_outline,
            children: (results['suggestions'] as List? ?? [])
                .map((s) => Text("• $s"))
                .toList(),
          ).animate().fadeIn(delay: 900.ms),

          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text("Try Another Test"),
            onPressed: _resetTest,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.accent.withAlpha(204),
              foregroundColor: Colors.white,
            ),
          ).animate().fadeIn(delay: 1000.ms),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatsBar() =>
      _LiveStat(label: "Time Left", value: "${_seconds}s", primary: true);

  Widget _buildActionBar() {
    if (_isRecording) {
      return ElevatedButton.icon(
        icon: const Icon(Icons.stop_circle_outlined),
        label: const Text("Stop Recording"),
        onPressed: _stopRecording,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.recording,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        ),
      );
    }
    if (!_isRecording && _audioPath != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: AppColors.textFaded,
              size: 28,
            ),
            onPressed: _resetTest,
          ),
          const SizedBox(width: 40),
          ElevatedButton.icon(
            icon: _isSubmitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.send),
            label: Text(_isSubmitting ? "Submitting..." : "Submit"),
            onPressed: _isSubmitting ? null : _submitTest,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent.withAlpha(204),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
          ),
        ],
      );
    }
    return ElevatedButton.icon(
      icon: const Icon(Icons.mic),
      label: const Text("Start Recording"),
      onPressed: _startRecording,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent.withAlpha(204),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      ),
    );
  }

  Widget _buildReferenceTextView() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            widget.referenceText,
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceCodePro(
              fontSize: 20,
              color: AppColors.textFaded,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverallScoreGauge(double score) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 12.0,
      percent: (score.clamp(0.0, 100.0)) / 100,
      center: Text(
        score.toStringAsFixed(1),
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
          "Overall Score",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppColors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

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

class _LiveStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _LiveStatCard({
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
