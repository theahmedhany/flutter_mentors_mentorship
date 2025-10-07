import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_product_card.dart';
import 'package:week_3/core/helpers/extensions.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/routing/routes.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/home/presentation/widgets/home_brand_list.dart';
import 'package:week_3/features/home/presentation/widgets/home_search_field.dart';
import 'package:week_3/features/home/presentation/widgets/home_section_header.dart';

import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(
        name: "Nike Sportswear Club Fleece",
        price: 99,
        image:
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      ),
      ProductModel(
        name: "Trail Running Jacket Nike Windrunner",
        price: 99,
        image:
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      ),
      ProductModel(
        name: "Nike Crew Neck",
        price: 79,
        image:
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      ),
      ProductModel(
        name: "Windbreaker Pro",
        price: 89,
        image:
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      ),
    ];

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
              HomeSectionHeader(title: "Choose Brand", press: () {}),
              verticalSpace(8),
              const HomeBrandList(),
              verticalSpace(20),
              HomeSectionHeader(
                title: "New Arrival",
                press: () {
                  context.pushNamed(Routes.productsScreen);
                },
              ),
              verticalSpace(8),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 290.h,
                ),
                itemBuilder: (context, index) {
                  return CustomProductCard(
                    product: products[index],
                    onTap: () {
                      context.pushNamed(Routes.productDetailsScreen);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductModel {
  final String name;
  final double price;
  final String image;

  ProductModel({required this.name, required this.price, required this.image});
}
