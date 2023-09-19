import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kgiantinsight/components/lineChart.dart';
import 'package:kgiantinsight/controllers/salesController.dart';
import 'package:kgiantinsight/models/salesModel.dart';
import 'package:kgiantinsight/resources/app_colors.dart';
import 'package:kgiantinsight/resources/app_custom.dart';
import 'package:intl/intl.dart';

class SalesAnalysisView extends StatefulWidget {
  const SalesAnalysisView({super.key});

  @override
  State<SalesAnalysisView> createState() => _SalesAnalysisViewState();
}

class _SalesAnalysisViewState extends State<SalesAnalysisView> {
  late Future<List<AnalysisView>> _futureSalesAnalysis;

  var numberF = NumberFormat('###,###,###');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureSalesAnalysis = fetchSales();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FutureBuilder<List<AnalysisView>>(
                  future: _futureSalesAnalysis,
                  builder: (context, snapshot) {
                    final List<AnalysisView>? analyses = snapshot.data;

                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(
                          child: TextWhite(data: 'No Data Found'));
                    }

                    if (analyses != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            dtAnalysisChart(analyses),
                            Expanded(child: dtAnalysis(analyses)),
                          ],
                        ),
                      );
                    }

                    return const Center(
                        child: TextWhite(data: 'No Data Found'));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('뒤로'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dtAnalysisChart(List<AnalysisView> dt) {
    return Container(
      padding: EdgeInsets.all(4),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(
          children: [
            const Text(
              'Monthly Sales',
              style: TextStyle(
                color: AppColors.mainTextColor1,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            Expanded(
              child: LineChartComponent(isShowingMainData: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget dtAnalysis(List<AnalysisView> dt) {
    var resultCol = [
      DataColumn2(
        label: TextWhite(data: '일자'),
      ),
      DataColumn2(
        label: TextWhite(data: '주문금액'),
        numeric: true,
      ),
      DataColumn2(
        label: TextWhite(data: '결제금액'),
        numeric: true,
      ),
      DataColumn2(
        label: TextWhite(data: '할인금액'),
        numeric: true,
      ),
    ];

    var resultRow = dt.map((e) {
      return DataRow(
        cells: [
          DataCell(TextWhite(data: e.dailyDate.toString())),
          DataCell(TextWhite(data: numberF.format(e.orderAmt))),
          DataCell(TextWhite(data: numberF.format(e.paidAmt))),
          DataCell(TextWhite(data: numberF.format(e.discountAmt))),
        ],
      );
    }).toList();

    return Container(
      padding: EdgeInsets.all(8),
      child: DataTable2(
        columnSpacing: 20,
        horizontalMargin: 12,
        minWidth: 500,
        columns: resultCol,
        rows: resultRow,
      ),
    );
  }
}
