import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/brands/presentation/widgets/brand_card.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> brands = [
      {
        'name': 'Nike',
        'description':
            'Just Do It. Global leader in sportswear and innovation.',
        'image':
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      },
      {
        'name': 'Adidas',
        'description':
            'Impossible is Nothing. Designed for performance and comfort.',
        'image':
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      },
      {
        'name': 'Puma',
        'description':
            'Forever Faster. Bold designs for athletes and trendsetters.',
        'image':
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      },
      {
        'name': 'Reebok',
        'description':
            'Empowering movement since 1958 with heritage and style.',
        'image':
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
      },
      {
        'name': 'New Balance',
        'description':
            'Achieve new balance in performance and lifestyle footwear.',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/8/8d/New_Balance_logo.svg',
      },
      {
        'name': 'Under Armour',
        'description': 'Protect this house. Innovative athletic performance.',
        'image':
            'https://upload.wikimedia.org/wikipedia/commons/0/04/Under_armour_logo.svg',
      },
    ];

    return Scaffold(
      backgroundColor: LightAppColors.background,
      appBar: AppBar(
        title: Text(
          'All Brands',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
        backgroundColor: LightAppColors.background,
        iconTheme: const IconThemeData(color: LightAppColors.grey900),
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.separated(
        itemCount: brands.length,
        padding: EdgeInsets.all(20.w),
        separatorBuilder: (context, index) => verticalSpace(16),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return BrandCard(
            name: brand['name']!,
            description: brand['description']!,
            imageUrl: brand['image']!,
          );
        },
      ),
    );
  }
}
