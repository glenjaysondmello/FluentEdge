import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/glass_container.dart';

class DashboardStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  const DashboardStatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? AppColors.accent, size: 28),
            const SizedBox(height: 8),
          ],
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12, // Adjusted for better fit
              color: AppColors.textFaded,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
