import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.r,
      width: 40.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: LightAppColors.primary500, width: 1.5.r),
      ),
      child: Center(
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(
            Icons.favorite,
            color: LightAppColors.primary500,
            size: 20.r,
          ),
        ),
      ),
    );
  }
}
