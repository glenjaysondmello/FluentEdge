import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile/core/widgets/action_card_starter.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/features/typing/presentation/screens/typing_dashboard_screen.dart';
import 'package:mobile/features/typing/presentation/screens/typing_text_launcer_screen.dart';

class TypingScreen extends StatelessWidget {
  const TypingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Typing Practice',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionCardStarter(
                icon: Icons.keyboard_alt_outlined,
                title: 'Start New Test',
                subtitle: 'Challenge yourself and measure your speed.',
                buttonText: 'Start Now',
                isPrimary: true,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TypingTestLauncherScreen(),
                  ),
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),
              const SizedBox(height: 20),
              ActionCardStarter(
                icon: Icons.dashboard_outlined,
                title: 'Typing Dashboard',
                subtitle: 'Analyze your performance and progress.',
                buttonText: 'View Stats',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardTyping()),
                ),
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
