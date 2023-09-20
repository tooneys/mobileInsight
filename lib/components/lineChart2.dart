import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kgiantinsight/models/salesModel.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class LineChartWidget extends StatelessWidget {
  final List<AnalysisView> points;

  const LineChartWidget({required this.points, super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      duration: const Duration(milliseconds: 250),
      LineChartData(
        titlesData: titlesData,
        lineBarsData: [
          orderData,
          paidData,
          discountData,
        ],
        minX: 0,
        minY: 0,
        maxX: points.length.toDouble(),
      ),
    );
  }

  FlTitlesData get titlesData => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 5,
            // getTitlesWidget: (value, meta) => SideTitleWidget(
            //   child: Text(
            //     '${value}일',
            //     style: TextStyle(color: AppColors.mainTextColor1),
            //   ),
            //   axisSide: meta.axisSide,
            // ),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 60000000,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );

  LineChartBarData get orderData => LineChartBarData(
        spots: points
            .map((point) => FlSpot(
                double.parse(point.dailyDate.substring(6, 8)), point.orderAmt))
            .toList(),
        isCurved: true,
        dotData: const FlDotData(show: true),
        color: AppColors.contentColorCyan,
      );

  LineChartBarData get paidData => LineChartBarData(
        spots: points
            .map((point) => FlSpot(
                double.parse(point.dailyDate.substring(6, 8)), point.paidAmt))
            .toList(),
        isCurved: true,
        dotData: const FlDotData(show: true),
        color: AppColors.contentColorOrange,
        barWidth: 5,
      );

  LineChartBarData get discountData => LineChartBarData(
        spots: points
            .map((point) => FlSpot(
                double.parse(point.dailyDate.substring(6, 8)),
                point.discountAmt))
            .toList(),
        isCurved: true,
        dotData: const FlDotData(show: true),
        color: AppColors.contentColorRed,
      );
}
