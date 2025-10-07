import 'package:flutter/material.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.font16Regular.copyWith(
      color: LightAppColors.grey600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyles.font18Bold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),

        verticalSpace(8),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstChild: Text(
            widget.description,
            style: textStyle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(widget.description, style: textStyle),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),

        verticalSpace(6),

        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Read Less' : 'Read More..',
            style: AppTextStyles.font14Bold.copyWith(
              color: LightAppColors.info,
            ),
          ),
        ),
      ],
    );
  }
}
