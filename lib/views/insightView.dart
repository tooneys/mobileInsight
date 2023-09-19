import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kgiantinsight/components/dataGrid.dart';
import 'package:kgiantinsight/components/lineChart.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class InSightView extends StatefulWidget {
  const InSightView({super.key});

  @override
  State<InSightView> createState() => _InSightViewState();
}

class _InSightViewState extends State<InSightView> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
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
              AspectRatio(
                aspectRatio: 1.23,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 37,
                        ),
                        const Text(
                          'Monthly Sales',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16, left: 6),
                            child: LineChartComponent(
                                isShowingMainData: isShowingMainData),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white
                            .withOpacity(isShowingMainData ? 1.0 : 0.5),
                      ),
                      onPressed: () {
                        setState(() {
                          isShowingMainData = !isShowingMainData;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: DataGridView(),),
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
}
