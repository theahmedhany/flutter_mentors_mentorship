import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/custom_loading.dart';
import '../../../../core/common/widgets/favorite_button.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.item});

  final ProductDetailsModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
            child: Container(
              height: 500.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: LightAppColors.primary500.withValues(alpha: 0.4),
                boxShadow: [
                  BoxShadow(
                    color: LightAppColors.grey400.withValues(alpha: 0.4),
                    blurRadius: 10.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: item.coverPictureUrl,
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

          Positioned(
            top: 28.r,
            right: 28.r,
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: LightAppColors.grey300,
                shape: BoxShape.circle,
              ),
              child: FavoriteButton(
                itemId: item.id,
                name: item.name,
                imageUrl: item.coverPictureUrl,
                price: item.price,
              ),
            ),
          ),

          Positioned(
            top: 28.r,
            left: 28.r,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.pop();
              },
              child: Container(
                height: 45.r,
                width: 45.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightAppColors.grey300,
                  border: Border.all(
                    color: LightAppColors.primary500,
                    width: 1.5.r,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: LightAppColors.primary500,
                    size: 20.r,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
