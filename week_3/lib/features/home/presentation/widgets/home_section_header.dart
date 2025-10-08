import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font18SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: press,
          child: Text(
            "View All",
            style: AppTextStyles.font14SemiBold.copyWith(
              color: LightAppColors.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
