import 'package:flutter/material.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class TextWhite extends StatelessWidget {
  const TextWhite({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(color: AppColors.mainTextColor1),
    );
  }
}