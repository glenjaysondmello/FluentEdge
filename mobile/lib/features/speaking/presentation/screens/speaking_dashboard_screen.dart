import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/dashboard_chart_card.dart';
import 'package:mobile/core/widgets/dashboard_stat_card.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/state_views.dart';
import 'package:mobile/features/speaking/presentation/screens/speaking_history_screen.dart';
import 'package:mobile/graphql/speaking/speaking.queries.graphql.dart';

class DashboardSpeaking extends StatelessWidget {
  const DashboardSpeaking({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Speaking Dashboard',
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          tooltip: 'Test History',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SpeakingHistoryScreen()),
          ),
        ),
      ],
      body: Query(
        options: QueryOptions(
          document: documentNodeQueryGetSpeakingTests,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (result.hasException) {
            return RefreshIndicator(
              onRefresh: refetch!,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ErrorStateView(onRetry: refetch),
                  ),
                ],
              ),
            );
          }

          final parsedData = result.data != null
              ? Query_GetSpeakingTests.fromJson(result.data!)
              : null;
          final tests =
              parsedData?.getSpeakingTests.map((e) => e.toJson()).toList() ??
              [];

          if (tests.isEmpty) {
            return RefreshIndicator(
              onRefresh: refetch!,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const EmptyStateView(
                      icon: Icons.mic_none,
                      title: "No Speaking Tests Yet",
                      subtitle: "Take a test to see your dashboard!",
                    ),
                  ),
                ],
              ),
            );
          }

          // --- Data Processing ---
          Map<String, double> averageScores = {
            'fluency': 0,
            'pronunciation': 0,
            'grammar': 0,
            'vocabulary': 0,
          };

          if (tests.isNotEmpty) {
            for (var key in averageScores.keys) {
              double total = 0;
              int count = 0;
              for (var test in tests) {
                final val = test['scores'][key];
                if (val is num) {
                  total += val;
                  count++;
                }
              }
              averageScores[key] = count > 0 ? total / count : 0;
            }
          }

          String avgScore(String key) =>
              averageScores[key]?.toStringAsFixed(1) ?? "0.0";

          return RefreshIndicator(
            onRefresh: refetch!,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  "Test Analysis",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ).animate().fadeIn(duration: 400.ms).slideX(),
                const SizedBox(height: 16),

                // Using Reusable DashboardStatCard
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.5,
                  children: [
                    DashboardStatCard(
                      label: "Fluency",
                      value: avgScore('fluency'),
                    ),
                    DashboardStatCard(
                      label: "Pronunciation",
                      value: avgScore('pronunciation'),
                    ),
                    DashboardStatCard(
                      label: "Grammar",
                      value: avgScore('grammar'),
                    ),
                    DashboardStatCard(
                      label: "Vocabulary",
                      value: avgScore('vocabulary'),
                    ),
                  ],
                ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

                const SizedBox(height: 24),

                // Using Reusable DashboardChartCard
                DashboardChartCard(
                  title: "Overall Score Over Time",
                  child: _buildLineChart(
                    tests,
                    (test) => (test['scores']?['overall'] ?? 0) as num,
                    AppColors.success, // Using AppColors
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLineChart(
    List tests,
    num Function(dynamic) getValue,
    Color lineColor,
  ) {
    final spots = tests.asMap().entries.map((entry) {
      final index = entry.key;
      final test = entry.value;
      final value = getValue(test);
      return FlSpot(index.toDouble(), value.toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 20,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.white.withAlpha(26), strokeWidth: 1),
          getDrawingVerticalLine: (value) =>
              FlLine(color: Colors.white.withAlpha(26), strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: max(1, (tests.length / 4).ceil()).toDouble(),
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= tests.length) return const Text('');
                final date = DateTime.tryParse(tests[index]['createdAt'] ?? '');
                if (date == null) return const Text('');
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    DateFormat('MMM d').format(date),
                    style: TextStyle(color: AppColors.textFaded, fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                value.toStringAsFixed(0),
                style: TextStyle(color: AppColors.textFaded, fontSize: 10),
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [lineColor.withAlpha(77), lineColor.withAlpha(0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
