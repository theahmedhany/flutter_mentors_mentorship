import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_2/core/theme/app_color.dart';

class TopCharacters extends StatelessWidget {
  const TopCharacters({super.key, required this.press});

  final VoidCallback press;

  final List<Map<String, String>> topCharacters = const [
    {
      'image': 'assets/images/charachter_1.png',
      'name': 'Gon Freecss',
      'anime': 'Hunter x Hunter',
    },
    {
      'image': 'assets/images/charachter_2.png',
      'name': 'Naruto Uzumaki',
      'anime': 'Naruto',
    },
    {
      'image': 'assets/images/charachter_3.jpg',
      'name': 'Luffy',
      'anime': 'One Piece',
    },
    {
      'image': 'assets/images/charachter_4.png',
      'name': 'Eren Yeager',
      'anime': 'Attack on Titan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.r),
        itemCount: topCharacters.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) {
          final char = topCharacters[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: press,
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(char['image']!),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  char['name']!,
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
                  char['anime']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.gray300,
                    fontSize: 14.sp,
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
