import 'package:flutter/material.dart';
import '../../features/speaking/presentation/screens/speaking_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionCardStarter extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isPrimary;

  const ActionCardStarter({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: themeColors['card'],
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white.withAlpha(30)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: themeColors['accent']),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeColors['text'],
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: themeColors['textFaded'],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          isPrimary
              ? ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColors['primaryAction'],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(buttonText),
                )
              : OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: themeColors['text'],
                    side: BorderSide(color: themeColors['textFaded']!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(buttonText),
                ),
        ],
      ),
    );
  }
}
