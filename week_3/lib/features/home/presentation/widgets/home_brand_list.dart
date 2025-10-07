import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/features/home/presentation/widgets/home_brand_list_item.dart';

class HomeBrandList extends StatelessWidget {
  const HomeBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return HomeBrandListItem(
            imagePath: "assets/images/placeholder_brand_image.png",
            brandName: 'Brand ${index + 1}',
          );
        },
      ),
    );
  }
}
