import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (mounted) {
          if (user != null) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            Navigator.of(context).pushReplacementNamed('/auth');
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A beautiful, consistent gradient background using AppColors
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                [
                      // 1. App logo with a fade-in and scale animation
                      Image.asset('assets/images/logo.png', width: 150)
                          .animate()
                          .fadeIn(duration: 800.ms)
                          .scale(
                            delay: 200.ms,
                            duration: 600.ms,
                            curve: Curves.elasticOut,
                          ),

                      const SizedBox(height: 24),

                      // 2. Branded title and tagline that animate in
                      Text(
                        'FluentEdge',
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hone Your Skills, Track Your Progress',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.text.withAlpha(200),
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

// FirebaseAuth.instance.authStateChanges().listen((user) async {
//         if (mounted) {
//           if (user != null) {
//             try {
//               final leaderboardService =
//                   Provider.of<LeaderboardFirestoreService>(
//                     context,
//                     listen: false,
//                   );

//               final client = GraphQLProvider.of(context).value;

//               await leaderboardService.fetchAndUploadStats(client);
//               print("Leaderboard stats updated successfully.");
//             } catch (e) {
//               print("Error updating leaderboard on splash: $e");
//             }
//             Navigator.of(context).pushReplacementNamed('/home');
//           } else {
//             Navigator.of(context).pushReplacementNamed('/auth');
//           }
//         }
//       });
//     });
