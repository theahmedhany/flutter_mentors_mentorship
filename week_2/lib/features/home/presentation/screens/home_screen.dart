import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_2/core/theme/app_color.dart';
import 'package:week_2/features/details/presentation/screens/details_screen.dart';
import 'package:week_2/features/home/presentation/widgets/all_anime_carousel.dart';
import 'package:week_2/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:week_2/features/home/presentation/widgets/filter_list_view.dart';
import 'package:week_2/features/home/presentation/widgets/top_characters.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> filterItems = [
    'All',
    'Popular',
    'Trending',
    'New Releases',
    'Action',
    'Adventure',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const CustomBottomNav(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.accentBlue.withValues(alpha: 0.8),
              AppColors.accentBlue.withValues(alpha: 0.4),
              AppColors.accentBlue.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              right: 0.w,
              child: SvgPicture.asset(
                'assets/icons/right_star_2.svg',
                width: 300.w,
                height: 300.h,
              ),
            ),

            SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.r,
                        vertical: 8.h,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Where Anime Comes Alive',
                          style: TextStyle(
                            color: AppColors.dark2,
                            fontSize: 24.sp,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
                      child: FilterListView(filterItems: filterItems),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: AllAnimeCarousel(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.r),
                      child: Text(
                        'Top Characters',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      child: TopCharacters(press: () {}),
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
