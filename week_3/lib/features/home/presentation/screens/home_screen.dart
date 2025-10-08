import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../products/presentation/widgets/all_products_list.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_brand_list.dart';
import '../widgets/home_search_field.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              verticalSpace(24),
              Text(
                "Hello",
                style: AppTextStyles.font24Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
              Text(
                "Welcome to Laza.",
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
              verticalSpace(20),
              const HomeSearchField(),
              verticalSpace(20),
              HomeSectionHeader(
                title: "Choose Brand",
                press: () {
                  context.pushNamed(Routes.brandsScreen);
                },
              ),
              verticalSpace(8),

              const HomeBrandList(),

              verticalSpace(20),
              HomeSectionHeader(
                title: "New Arrival",
                press: () {
                  context.pushNamed(Routes.productsScreen);
                },
              ),

              AllProductsList(
                physics: const NeverScrollableScrollPhysics(),
                wrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
