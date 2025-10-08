import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors/light_app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: LightAppColors.grey300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.menu),
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: LightAppColors.grey300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
        ),
      ],
    );
  }
}
