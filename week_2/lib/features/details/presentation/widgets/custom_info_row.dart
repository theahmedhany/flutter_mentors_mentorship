import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:week_2/core/theme/app_color.dart';

class CustomInfoRow extends StatelessWidget {
  const CustomInfoRow({
    super.key,
    required this.imagePath,
    required this.infoText,
  });

  final String imagePath, infoText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          width: 18.w,
          height: 18.h,
          colorFilter: ColorFilter.mode(AppColors.gray300, BlendMode.srcIn),
        ),

        SizedBox(width: 6.w),

        Text(
          infoText,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
