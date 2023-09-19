import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class DataGridView extends StatelessWidget {
  const DataGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text(
              'Column A',
              style: TextStyle(color: AppColors.mainTextColor1),
            ),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text(
              'Column B',
              style: TextStyle(color: AppColors.mainTextColor1),
            ),
          ),
          DataColumn(
            label: Text(
              'Column C',
              style: TextStyle(color: AppColors.mainTextColor1),
            ),
          ),
          DataColumn(
            label: Text(
              'Column D',
              style: TextStyle(color: AppColors.mainTextColor1),
            ),
          ),
          DataColumn(
            label: Text(
              'Column NUMBERS',
              style: TextStyle(color: AppColors.mainTextColor1),
            ),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
          100,
          (index) => DataRow(
            cells: [
              DataCell(Text(
                'A' * (10 - index % 10),
                style: TextStyle(color: AppColors.mainTextColor1),
              )),
              DataCell(Text(
                'B' * (10 - (index + 5) % 10),
                style: TextStyle(color: AppColors.mainTextColor1),
              )),
              DataCell(Text(
                'C' * (15 - (index + 5) % 10),
                style: TextStyle(color: AppColors.mainTextColor1),
              )),
              DataCell(Text(
                'D' * (15 - (index + 10) % 10),
                style: TextStyle(color: AppColors.mainTextColor1),
              )),
              DataCell(Text(
                ((index + 0.1) * 25.4).toString(),
                style: TextStyle(color: AppColors.mainTextColor1),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
