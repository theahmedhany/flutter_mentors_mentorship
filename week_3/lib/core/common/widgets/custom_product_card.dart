import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_loading.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:week_3/features/home/presentation/screens/home_screen.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const CustomProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightAppColors.primary500.withValues(alpha: 0.4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
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

                Positioned(top: 8.r, right: 8.r, child: FavoriteButton()),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                  verticalSpace(6),
                  Text(
                    "\$${product.price.toStringAsFixed(0)}",
                    style: AppTextStyles.font18Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
