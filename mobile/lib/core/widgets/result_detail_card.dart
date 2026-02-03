import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/app_colors.dart';

class ResultDetailCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const ResultDetailCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.accent),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white24, height: 20),
            if (children.isEmpty)
              Text("None!", style: TextStyle(color: AppColors.textFaded))
            else
              ...children.map(
                (child) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: DefaultTextStyle(
                    style: GoogleFonts.poppins(
                      color: AppColors.text,
                      fontSize: 15,
                    ),
                    child: child,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
