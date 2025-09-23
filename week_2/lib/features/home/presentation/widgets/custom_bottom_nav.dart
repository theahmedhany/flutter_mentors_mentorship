import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:week_2/core/theme/app_color.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
      child: GNav(
        gap: 8,
        color: AppColors.gray300,
        activeColor: AppColors.white,
        tabBackgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 10.r),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(
            icon: Icons.home,
            leading: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? AppColors.white : AppColors.gray300,
                BlendMode.srcIn,
              ),
              width: 22.w,
              height: 22.h,
            ),
            text: "Home",
          ),
          GButton(
            icon: Icons.book,
            leading: SvgPicture.asset(
              'assets/icons/library.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? AppColors.white : AppColors.gray300,
                BlendMode.srcIn,
              ),
              width: 22.w,
              height: 22.h,
            ),
            text: "Library",
          ),
          GButton(
            icon: Icons.search,
            leading: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? AppColors.white : AppColors.gray300,
                BlendMode.srcIn,
              ),
              width: 22.w,
              height: 22.h,
            ),
            text: "Search",
          ),
          GButton(
            icon: Icons.language,
            leading: SvgPicture.asset(
              'assets/icons/ball.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? AppColors.white : AppColors.gray300,
                BlendMode.srcIn,
              ),
              width: 22.w,
              height: 22.h,
            ),
            text: "Action",
          ),
          GButton(
            icon: Icons.settings,
            leading: SvgPicture.asset(
              'assets/icons/setting.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 4 ? AppColors.white : AppColors.gray300,
                BlendMode.srcIn,
              ),
              width: 22.w,
              height: 22.h,
            ),
            text: "Settings",
          ),
        ],
      ),
    );
  }
}
