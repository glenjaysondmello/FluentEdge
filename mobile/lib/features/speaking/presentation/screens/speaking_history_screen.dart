import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobile/graphql/speaking/speaking.queries.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/state_views.dart';

class SpeakingHistoryScreen extends StatelessWidget {
  const SpeakingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Speaking History',
      body: Query(
        options: QueryOptions(
          document: documentNodeQueryGetSpeakingTests,
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
              ? Query_GetSpeakingTests.fromJson(result.data!)
              : null;

          final tests =
              parsedData?.getSpeakingTests.map((e) => e.toJson()).toList() ??
              [];

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
    final scores = test['scores'];

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
          // Header Row: Overall Score & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Overall: ${(scores['overall'] as num).toStringAsFixed(1)}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.accent,
                ),
              ),
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
          // Transcript Preview
          Text(
            '"${test['transcript']}"',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: AppColors.text,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          // Detailed Sub-scores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(
                label: 'Fluency',
                value: (scores['fluency'] as num).toStringAsFixed(1),
              ),
              _StatItem(
                label: 'Pronunciation',
                value: (scores['pronunciation'] as num).toStringAsFixed(1),
              ),
              _StatItem(
                label: 'Grammar',
                value: (scores['grammar'] as num).toStringAsFixed(1),
              ),
              _StatItem(
                label: 'Vocabulary',
                value: (scores['vocabulary'] as num).toStringAsFixed(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A small helper widget to display a single stat inside the card.
class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.text,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textFaded),
        ),
      ],
    );
  }
}
