import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kgiantinsight/components/dataGrid.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

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
                child: DataGridView(),
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
}
