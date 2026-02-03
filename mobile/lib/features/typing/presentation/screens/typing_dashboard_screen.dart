import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/typing/presentation/screens/typing_history_test.dart';
import 'package:mobile/graphql/typing/typing.queries.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/dashboard_chart_card.dart';
import 'package:mobile/core/widgets/dashboard_stat_card.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';
import 'package:mobile/core/widgets/state_views.dart';

class DashboardTyping extends StatelessWidget {
  const DashboardTyping({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Typing Dashboard',
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          tooltip: 'Test History',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TypingHistoryScreen()),
          ),
        ),
      ],
      body: Query(
        options: QueryOptions(
          document: documentNodeQueryGetTypingTests,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
        builder: (result, {fetchMore, refetch}) {
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
              ? Query_GetTypingTests.fromJson(result.data!)
              : null;

          final tests =
              parsedData?.getTypingTests.map((e) => e.toJson()).toList() ?? [];

          if (tests.isEmpty) {
            return RefreshIndicator(
              onRefresh: refetch!,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const EmptyStateView(
                      icon: Icons.keyboard,
                      title: "No Typing Tests Yet",
                      subtitle: "Take a test to see your dashboard!",
                    ),
                  ),
                ],
              ),
            );
          }

          // Data Processing
          // Sort by creation date for the charts
          tests.sort(
            (a, b) => DateTime.parse(
              a['createdAt'],
            ).compareTo(DateTime.parse(b['createdAt'])),
          );

          final avgWpm =
              tests.map((t) => t['wpm'] as num).reduce((a, b) => a + b) /
              tests.length;
          final avgAccuracy =
              tests.map((t) => t['accuracy'] as num).reduce((a, b) => a + b) /
              tests.length;
          final avgScore =
              tests.map((t) => t['score'] as num).reduce((a, b) => a + b) /
              tests.length;

          return RefreshIndicator(
            onRefresh: refetch!,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  "Performance Overview",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ).animate().fadeIn(duration: 400.ms).slideX(),
                const SizedBox(height: 16),

                // Summary Stat Cards
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    DashboardStatCard(
                      icon: Icons.speed,
                      label: "Avg WPM",
                      value: avgWpm.toStringAsFixed(1),
                      iconColor: AppColors.accent,
                    ),
                    DashboardStatCard(
                      icon: Icons.ads_click,
                      label: "Avg Accuracy",
                      value: "${avgAccuracy.toStringAsFixed(1)}%",
                      iconColor: AppColors.success,
                    ),
                    DashboardStatCard(
                      icon: Icons.star,
                      label: "Avg Score",
                      value: avgScore.toStringAsFixed(1),
                      iconColor: Colors.amber,
                    ),
                  ],
                ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

                const SizedBox(height: 24),

                // Main Chart for WPM
                DashboardChartCard(
                  title: "WPM Over Time",
                  child: _buildLineChart(
                    tests,
                    (test) => test['wpm'],
                    AppColors.accent,
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
                const SizedBox(height: 16),

                // Sparkline charts for other metrics
                Row(
                  children: [
                    Expanded(
                      child: DashboardChartCard(
                        title: "Accuracy",
                        isMini: true,
                        child: _buildLineChart(
                          tests,
                          (test) => test['accuracy'],
                          AppColors.success,
                          isSparkline: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DashboardChartCard(
                        title: "Score",
                        isMini: true,
                        child: _buildLineChart(
                          tests,
                          (test) => test['score'],
                          Colors.amber,
                          isSparkline: true,
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Builds a beautifully styled LineChart.
  Widget _buildLineChart(
    List tests,
    num Function(dynamic) getValue,
    Color lineColor, {
    bool isSparkline = false,
  }) {
    final spots = tests.asMap().entries.map((entry) {
      final index = entry.key;
      final test = entry.value;
      return FlSpot(index.toDouble(), getValue(test).toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        // General Styling
        gridData: FlGridData(
          show: !isSparkline,
          drawVerticalLine: true,
          horizontalInterval: 20,
          verticalInterval: (tests.length / 4).ceilToDouble(),
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.white.withAlpha(26), strokeWidth: 1),
          getDrawingVerticalLine: (value) =>
              FlLine(color: Colors.white.withAlpha(26), strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          show: !isSparkline,
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
              interval: (tests.length / 4).ceilToDouble(),
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= tests.length) return const Text('');
                final date = DateTime.parse(tests[index]['createdAt']);
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
                value.toInt().toString(),
                style: TextStyle(color: AppColors.textFaded, fontSize: 10),
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        // Line Styling
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: isSparkline ? 3 : 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: !isSparkline),
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
        // Interaction
        lineTouchData: LineTouchData(
          enabled: !isSparkline,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(1)}\n',
                TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: DateFormat('MMM d, yyyy').format(
                      DateTime.parse(tests[spot.x.toInt()]['createdAt']),
                    ),
                    style: TextStyle(color: AppColors.textFaded, fontSize: 12),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
