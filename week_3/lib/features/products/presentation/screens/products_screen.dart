import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_product_card.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/home/presentation/screens/home_screen.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

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

      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 290.h,
        ),
        itemBuilder: (context, index) {
          return CustomProductCard(product: products[index], onTap: () {});
        },
      ),
    );
  }
}
