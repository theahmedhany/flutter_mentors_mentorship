import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_2/core/theme/app_color.dart';
import 'package:week_2/features/details/presentation/widgets/custom_category_card.dart';
import 'package:week_2/features/details/presentation/widgets/custom_info_row.dart';
import 'package:week_2/features/details/presentation/widgets/details_buttons_row.dart';
import 'package:week_2/features/details/presentation/widgets/details_image_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark3,

      bottomNavigationBar: const DetailsButtonsRow(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: DetailsImageSection()),

          SliverToBoxAdapter(child: SizedBox(height: 80.h)),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCategoryCard(categoryName: 'Dark Fantasy'),
                SizedBox(width: 10.w),
                CustomCategoryCard(categoryName: 'Action'),
                SizedBox(width: 10.w),
                CustomCategoryCard(categoryName: 'Adventure'),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
              child: Divider(
                color: AppColors.gray300,
                thickness: 1.r,
                indent: 20.w,
                endIndent: 20.w,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomInfoRow(
                    imagePath: 'assets/icons/solid_eye.svg',
                    infoText: '2.3M views',
                  ),
                  SizedBox(width: 20.w),
                  const CustomInfoRow(
                    imagePath: 'assets/icons/hands_clapping.svg',
                    infoText: '2K clap',
                  ),
                  SizedBox(width: 20.w),
                  const CustomInfoRow(
                    imagePath: 'assets/icons/video_cd.svg',
                    infoText: '4 Seasons',
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(
                color: AppColors.gray300,
                thickness: 1.r,
                indent: 20.w,
                endIndent: 20.w,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/fire.png',
                    width: 32.w,
                    height: 32.h,
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
                      style: TextStyle(
                        color: AppColors.gray100,
                        fontSize: 14.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }
}
