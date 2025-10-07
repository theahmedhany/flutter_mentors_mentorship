import 'package:flutter/material.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: LightAppColors.primary600,
        color: LightAppColors.primary200,
        strokeWidth: 3,
      ),
    );
  }
}
