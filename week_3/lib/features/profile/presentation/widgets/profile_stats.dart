import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              label: 'Projects',
              value: '48',
              icon: Icons.work_outline,
            ),
          ),

          horizontalSpace(12),

          Expanded(
            child: _StatCard(
              label: 'Followers',
              value: '2.4K',
              icon: Icons.people_outline,
            ),
          ),

          horizontalSpace(12),

          Expanded(
            child: _StatCard(
              label: 'Following',
              value: '856',
              icon: Icons.person_add_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: LightAppColors.primary200,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: LightAppColors.primary700.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: LightAppColors.primary600, size: 28.r),
          verticalSpace(8),
          Text(
            value,
            style: AppTextStyles.font24Bold.copyWith(
              color: LightAppColors.grey900,
            ),
          ),
          verticalSpace(4),
          Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
