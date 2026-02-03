import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/auth/data/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobile/graphql/speaking/speaking.queries.graphql.dart';
import 'package:mobile/graphql/typing/typing.queries.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/dashboard_stat_card.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  bool _isLoading = true;
  String? _error;
  Map<String, dynamic> _overallStats = {};
  List<Map<String, dynamic>> _recentActivities = [];
  bool _didFetchData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didFetchData) {
      _didFetchData = true;
      _fetchDashboardData();
    }
  }

  Future<void> _fetchDashboardData() async {
    final client = GraphQLProvider.of(context).value;

    try {
      final results = await Future.wait([
        client.query(
          QueryOptions(
            document: documentNodeQueryGetSpeakingTests,
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
        client.query(
          QueryOptions(
            document: documentNodeQueryGetTypingTests,
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ]);

      if (!mounted) return;

      final speakingResult = results[0];
      final typingResult = results[1];

      if (speakingResult.hasException || typingResult.hasException) {
        throw Exception("Error fetching data. Please try again.");
      }

      final speakingDataParsed = speakingResult.data != null
          ? Query_GetSpeakingTests.fromJson(speakingResult.data!)
          : null;
      final typingDataParsed = typingResult.data != null
          ? Query_GetTypingTests.fromJson(typingResult.data!)
          : null;

      final List<Map<String, dynamic>> speakingTests =
          speakingDataParsed?.getSpeakingTests
              .map((e) => e.toJson())
              .toList() ??
          [];
      final List<Map<String, dynamic>> typingTests =
          typingDataParsed?.getTypingTests.map((e) => e.toJson()).toList() ??
          [];

      setState(() {
        _overallStats = _calculateOverallStats(speakingTests, typingTests);
        _recentActivities = _getRecentActivities(speakingTests, typingTests);
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Map<String, dynamic> _calculateOverallStats(
    List<Map<String, dynamic>> speakingTests,
    List<Map<String, dynamic>> typingTests,
  ) {
    final double avgSpeakingScore = speakingTests.isNotEmpty
        ? speakingTests
                  .map<double>(
                    (t) => (t['scores']['overall'] as num).toDouble(),
                  )
                  .reduce((a, b) => a + b) /
              speakingTests.length
        : 0.0;

    final double avgWpm = typingTests.isNotEmpty
        ? typingTests
                  .map<double>((t) => (t['wpm'] as num).toDouble())
                  .reduce((a, b) => a + b) /
              typingTests.length
        : 0.0;

    final double avgAccuracy = typingTests.isNotEmpty
        ? typingTests
                  .map<double>((t) => (t['accuracy'] as num).toDouble())
                  .reduce((a, b) => a + b) /
              typingTests.length
        : 0.0;

    return {
      'totalTests': speakingTests.length + typingTests.length,
      'avgSpeakingScore': avgSpeakingScore,
      'avgWpm': avgWpm,
      'avgAccuracy': avgAccuracy,
    };
  }

  List<Map<String, dynamic>> _getRecentActivities(
    List<Map<String, dynamic>> speakingTests,
    List<Map<String, dynamic>> typingTests,
  ) {
    final combined = [
      ...speakingTests.map((t) => {...t, 'type': 'speaking'}),
      ...typingTests.map((t) => {...t, 'type': 'typing'}),
    ];

    combined.sort(
      (a, b) => DateTime.parse(
        b['createdAt'],
      ).compareTo(DateTime.parse(a['createdAt'])),
    );

    return combined.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    // We can leave the title empty for the Dashboard to save space for the Profile Header
    return GradientScaffold(
      title: '',
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : _error != null
          ? Center(
              child: Text(
                _error!,
                style: const TextStyle(color: AppColors.text),
              ),
            )
          : RefreshIndicator(
              onRefresh: _fetchDashboardData,
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  _UserProfileHeader(
                    name: user?.displayName ?? 'Guest',
                    imageUrl: user?.photoURL,
                  ).animate().fadeIn(duration: 400.ms),

                  const SizedBox(height: 30),

                  _SectionTitle(title: 'Overall Performance'),
                  const SizedBox(height: 10),
                  _OverallStatsGrid(stats: _overallStats)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms)
                      .slideY(begin: 0.2),

                  const SizedBox(height: 30),

                  _SectionTitle(title: 'Recent Activity'),
                  const SizedBox(height: 10),
                  if (_recentActivities.isEmpty)
                    const Center(
                      child: Text(
                        "No activities yet.",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  else
                    ..._recentActivities.asMap().entries.map((entry) {
                      return _RecentActivityCard(test: entry.value)
                          .animate()
                          .fadeIn(
                            delay: (400 + entry.key * 100).ms,
                            duration: 400.ms,
                          )
                          .slideX(begin: -0.2);
                    }),
                ],
              ),
            ),
    );
  }
}

class _UserProfileHeader extends StatelessWidget {
  final String name;
  final String? imageUrl;
  const _UserProfileHeader({required this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white24,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? const Icon(Icons.person, size: 30, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: GoogleFonts.poppins(
                color: AppColors.textFaded,
                fontSize: 16,
              ),
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                color: AppColors.text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        color: AppColors.text,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _OverallStatsGrid extends StatelessWidget {
  final Map<String, dynamic> stats;
  const _OverallStatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.6,
      children: [
        DashboardStatCard(
          icon: Icons.mic,
          label: 'Avg. Speaking Score',
          value: (stats['avgSpeakingScore'] as double).toStringAsFixed(1),
          iconColor: AppColors.success,
        ),
        DashboardStatCard(
          icon: Icons.keyboard,
          label: 'Avg. Typing WPM',
          value: (stats['avgWpm'] as double).toStringAsFixed(1),
          iconColor: Colors.amber,
        ),
        DashboardStatCard(
          icon: Icons.check_circle,
          label: 'Avg. Accuracy',
          value: "${(stats['avgAccuracy'] as double).toStringAsFixed(1)}%",
          iconColor: AppColors.accent,
        ),
        DashboardStatCard(
          icon: Icons.format_list_numbered,
          label: 'Total Tests',
          value: stats['totalTests'].toString(),
          iconColor: Colors.white,
        ),
      ],
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  final Map<String, dynamic> test;
  const _RecentActivityCard({required this.test});

  @override
  Widget build(BuildContext context) {
    final isSpeaking = test['type'] == 'speaking';
    final date = DateFormat.yMMMd().format(DateTime.parse(test['createdAt']));

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            isSpeaking ? Icons.mic : Icons.keyboard,
            color: isSpeaking ? AppColors.success : Colors.amber,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSpeaking ? 'Speaking Test' : 'Typing Test',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    color: AppColors.textFaded,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            isSpeaking
                ? 'Score: ${(test['scores']['overall'] as num).toStringAsFixed(1)}'
                : 'WPM: ${(test['wpm'] as num).toStringAsFixed(1)}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
