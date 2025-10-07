import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class ProductDetailsSizeGuideline extends StatefulWidget {
  const ProductDetailsSizeGuideline({super.key});

  @override
  State<ProductDetailsSizeGuideline> createState() =>
      _ProductDetailsSizeGuidelineState();
}

class _ProductDetailsSizeGuidelineState
    extends State<ProductDetailsSizeGuideline> {
  String? selectedSize;

  final List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Size',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font18Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ),

            horizontalSpace(8),

            GestureDetector(
              onTap: () {},
              child: Text(
                'Size Guide',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
            ),
          ],
        ),

        verticalSpace(8),

        Wrap(
          spacing: 8.r,
          children: sizes.map((size) {
            return ChoiceChip(
              selectedColor: LightAppColors.primary200,
              label: Text(size),
              selected: selectedSize == size,
              onSelected: (selected) {
                setState(() {
                  selectedSize = selected ? size : null;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
