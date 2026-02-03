import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile/core/widgets/action_card_starter.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/features/speaking/presentation/screens/speaking_dashboard_screen.dart';
import 'package:mobile/features/speaking/presentation/screens/speaking_text_launcer_screen.dart';

class SpeakingScreen extends StatelessWidget {
  const SpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Speaking Practice',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionCardStarter(
                icon: Icons.mic_none_outlined,
                title: 'Start New Test',
                subtitle: 'Test your pronunciation and fluency.',
                buttonText: 'Start Now',
                isPrimary: true,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SpeakingTestLauncherScreen(),
                  ),
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),
              const SizedBox(height: 20),
              ActionCardStarter(
                icon: Icons.dashboard_outlined,
                title: 'Speaking Dashboard',
                subtitle: 'Review your scores and suggestions.',
                buttonText: 'View Stats',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardSpeaking()),
                ),
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
