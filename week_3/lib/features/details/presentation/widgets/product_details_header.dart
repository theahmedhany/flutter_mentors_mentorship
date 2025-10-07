import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Map<String, dynamic> product;
  final double discountedPrice;

  const ProductDetailsHeader({
    super.key,
    required this.product,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                product['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
            ),
            horizontalSpace(8),
            Text(
              'Price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font16Regular.copyWith(
                color: LightAppColors.grey600,
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Text(
                product['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font24Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ),
            horizontalSpace(8),
            Text(
              discountedPrice.toStringAsFixed(0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font24Bold.copyWith(
                color: LightAppColors.grey900,
              ),
            ),
          ],
        ),

        verticalSpace(8),

        Row(
          children: [
            _buildRatingStars(product['rating']),
            horizontalSpace(8),
            Text(
              '${product['rating'].toStringAsFixed(1)} (${product['reviewsCount']} reviews)',
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey600,
              ),
            ),
            const Spacer(),
            if (product['discountPercentage'] > 0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 2.r),
                decoration: BoxDecoration(
                  color: LightAppColors.error,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '${product['discountPercentage']}% OFF',
                  style: AppTextStyles.font12SemiBold.copyWith(
                    color: LightAppColors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: LightAppColors.warning,
          size: 16.r,
        );
      }),
    );
  }
}
