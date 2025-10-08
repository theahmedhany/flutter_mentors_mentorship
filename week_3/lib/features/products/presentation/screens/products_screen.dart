import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/products/presentation/widgets/all_products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      appBar: AppBar(
        title: Text(
          'Products Screen',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: LightAppColors.primary600,
          ),
        ),
        backgroundColor: LightAppColors.background,
        iconTheme: const IconThemeData(color: LightAppColors.primary600),
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: AllProductsList(),
      ),
    );
  }
}
