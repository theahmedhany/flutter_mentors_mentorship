import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_loading.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:week_3/features/favorite/presentation/widgets/favorite_button.dart';

class FavoriteCard extends StatelessWidget {
  final Product product;

  const FavoriteCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.r),
      decoration: BoxDecoration(
        color: LightAppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: LightAppColors.primary500, width: 2.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: LightAppColors.primary500.withValues(alpha: 0.4),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const Center(child: CustomLoading());
                },
                errorWidget: (context, url, error) {
                  return Center(
                    child: Image.asset(
                      'assets/master/logo.png',
                      width: 100.w,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyles.font18Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(12),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font18SemiBold.copyWith(
                      color: LightAppColors.grey700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 16.r),
            child: FavoriteButton(),
          ),
        ],
      ),
    );
  }
}
