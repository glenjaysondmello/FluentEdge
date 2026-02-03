import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/app_colors.dart';

class DashboardChartCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isMini;

  const DashboardChartCard({
    super.key,
    required this.title,
    required this.child,
    this.isMini = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isMini
          ? const EdgeInsets.fromLTRB(8, 16, 8, 8)
          : const EdgeInsets.fromLTRB(16, 24, 16, 12),
      height: isMini ? 150 : 300,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isMini ? 14 : 18,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}
