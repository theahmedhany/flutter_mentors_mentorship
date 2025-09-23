import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_2/core/theme/app_color.dart';

class AllAnimeCarousel extends StatelessWidget {
  const AllAnimeCarousel({super.key, required this.press});

  final VoidCallback press;

  final List<Map<String, String>> animeTitles = const [
    {
      'image': 'assets/images/poster_1.png',
      'title': 'Demon Slayer',
      'genre': 'Action',
      'rate': '4.8',
    },
    {
      'image': 'assets/images/poster_2.png',
      'title': 'Detective Conan',
      'genre': 'Mystery',
      'rate': '4.7',
    },
    {
      'image': 'assets/images/poster_3.png',
      'title': 'Hunter x Hunter',
      'genre': 'Adventure',
      'rate': '5.0',
    },
    {
      'image': 'assets/images/poster_4.png',
      'title': 'Dragon Ball Z',
      'genre': 'Action',
      'rate': '4.6',
    },
    {
      'image': 'assets/images/poster_5.png',
      'title': 'Attack on Titan',
      'genre': 'Drama',
      'rate': '4.8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.r),
        itemCount: animeTitles.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) {
          final anime = animeTitles[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: press,
            child: Column(
              children: [
                Container(
                  height: 247.h,
                  width: 198.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.accentPurple,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          anime['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8.h,
                        right: 14.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.r,
                            vertical: 2.r,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.primaryLight,
                                size: 16.r,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                anime['rate']!,
                                style: TextStyle(
                                  color: AppColors.dark1,
                                  fontSize: 12.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  anime['title']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.dark1,
                    fontSize: 16.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  anime['genre']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.gray300,
                    fontSize: 12.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
