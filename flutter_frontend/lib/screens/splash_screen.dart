import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_frontend/provider/leaderboard_firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/graphql_documents.dart';

// Using the same theme colors for consistency
const themeColors = {
  'backgroundStart': Color(0xFF2A2A72),
  'backgroundEnd': Color(0xFF009FFD),
  'text': Colors.white,
};

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LeaderboardFirestoreService leaderboardService =
      LeaderboardFirestoreService();
  @override
  void initState() {
    super.initState();

    // Your navigation logic is already perfect. It efficiently listens for
    // the auth state and navigates as soon as the check is complete.
    // We'll add a small artificial delay just to ensure the animation is visible.
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (mounted) {
          if (user != null) {
            try {
              await fetchAndUploadStats(context);
              print("Leaderboard stats updated successfully.");
            } catch (e) {
              print("Error updating leaderboard on splash: $e");
            }
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            Navigator.of(context).pushReplacementNamed('/auth');
          }
        }
      });
    });
  }

  Future<void> fetchAndUploadStats(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;

    try {
      final resuts = await Future.wait([
        client.query(
          QueryOptions(
            document: gql(getSpeakingTestQuery),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
        client.query(
          QueryOptions(
            document: gql(getTypingTestQuery),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ]);

      if (!mounted) return;

      final speakingResult = resuts[0];
      final typingResult = resuts[1];

      if (speakingResult.hasException || typingResult.hasException) {
        throw Exception("Error fetching data. Please try again.");
      }

      final List<dynamic> speakingData =
          speakingResult.data?['getSpeakingTests'] ?? [];
      final speakingTests = speakingData
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final List<dynamic> typingData =
          typingResult.data?['getTypingTests'] ?? [];
      final typingTests = typingData
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final calculatedStats = _calculateOverallStats(
        speakingTests,
        typingTests,
      );

      leaderboardService.updateLeaderboardEntry(calculatedStats);
    } catch (e) {
      print("Failed to fetch and upload stats: $e");
      rethrow;
    }
  }

  Map<String, dynamic> _calculateOverallStats(
    List<Map<String, dynamic>> speakingTests,
    List<Map<String, dynamic>> typingTests,
  ) {
    // Calculate average speaking score
    final double avgSpeakingScore = speakingTests.isNotEmpty
        ? speakingTests
                  .map<double>(
                    (t) => (t['scores']['overall'] as num).toDouble(),
                  )
                  .reduce((a, b) => a + b) /
              speakingTests.length
        : 0.0;

    // Calculate average WPM
    final double avgWpm = typingTests.isNotEmpty
        ? typingTests
                  .map<double>((t) => (t['wpm'] as num).toDouble())
                  .reduce((a, b) => a + b) /
              typingTests.length
        : 0.0;

    // Calculate average accuracy
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A beautiful, consistent gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              themeColors['backgroundStart']!,
              themeColors['backgroundEnd']!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                [
                      // app logo with a fade-in and scale animation
                      Image.asset(
                            'assets/images/logo.png',
                            width: 150, // Adjust the size as needed
                          )
                          .animate()
                          .fadeIn(duration: 800.ms)
                          .scale(
                            delay: 200.ms,
                            duration: 600.ms,
                            curve: Curves.elasticOut,
                          ),

                      const SizedBox(height: 24),

                      // 3. A branded title and tagline that animate in
                      Text(
                        'FluentEdge',
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: themeColors['text'],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hone Your Skills, Track Your Progress',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: themeColors['text']!.withAlpha(200),
                        ),
                      ),
                    ]
                    .animate(interval: 300.ms)
                    .fadeIn(duration: 600.ms, delay: 400.ms)
                    .slideY(
                      begin: 0.5,
                      duration: 600.ms,
                      curve: Curves.easeOut,
                    ),
          ),
        ),
      ),
    );
  }
}
