import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/state_views.dart';
import 'package:mobile/graphql/typing/typing.queries.graphql.dart';

class TypingHistoryScreen extends StatelessWidget {
  const TypingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Typing History',
      body: Query(
        options: QueryOptions(
          document: documentNodeQueryGetTypingTests,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
        builder: (result, {fetchMore, refetch}) {
          // Loading State
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          // Error State
          if (result.hasException) {
            return Center(
              child: ErrorStateView(
                onRetry: refetch!,
                message: "Failed to load history",
              ),
            );
          }

          final parsedData = result.data != null
              ? Query_GetTypingTests.fromJson(result.data!)
              : null;

          final tests =
              parsedData?.getTypingTests.map((e) => e.toJson()).toList() ?? [];

          // Sort by newest first
          tests.sort(
            (a, b) => DateTime.parse(
              b['createdAt'],
            ).compareTo(DateTime.parse(a['createdAt'])),
          );

          // Empty State
          if (tests.isEmpty) {
            return const EmptyStateView(
              icon: Icons.history_toggle_off,
              title: "No History Yet",
              subtitle: "Complete a test to see your progress!",
            );
          }

          // Success List
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            itemCount: tests.length,
            itemBuilder: (context, index) {
              final test = tests[index];
              return HistoryCard(test: test)
                  .animate()
                  .fadeIn(delay: (50 * (index % 10)).ms, duration: 400.ms)
                  .slideX(begin: -0.2, curve: Curves.easeOut);
            },
          );
        },
      ),
    );
  }
}

/// A custom widget to display a single test history item.
class HistoryCard extends StatelessWidget {
  final Map<String, dynamic> test;

  const HistoryCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    final DateTime createdAt = DateTime.parse(test['createdAt']);
    final String formattedDate = DateFormat.yMMMd().add_jm().format(createdAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withAlpha(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for the main score and date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Score
              Row(
                children: [
                  const Icon(
                    Icons.star_border_purple500_outlined,
                    color: AppColors.accent,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Score: ${test['score'].toStringAsFixed(0)}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
              // Date
              Text(
                formattedDate,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textFaded,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          Text(
            '"${test['referenceText']}"',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: AppColors.text,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          // Row for detailed stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(
                icon: Icons.speed_outlined,
                label: 'WPM',
                value: (test['wpm'] as num).toStringAsFixed(1),
              ),
              _StatItem(
                icon: Icons.dialpad_outlined,
                label: 'CPM',
                value: (test['cpm'] as num).toStringAsFixed(1),
              ),
              _StatItem(
                icon: Icons.ads_click_outlined,
                label: 'Accuracy',
                value: '${test['accuracy'].toStringAsFixed(1)}%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A small helper widget to display a single stat with an icon.
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textFaded, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.text,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textFaded),
        ),
      ],
    );
  }
}
