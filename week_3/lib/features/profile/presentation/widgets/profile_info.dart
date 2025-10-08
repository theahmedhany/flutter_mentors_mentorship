import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../data/models/user_profile_model.dart';
import '../logic/user_profile_cubit.dart';
import '../logic/user_profile_state.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState<UserProfileModel>>(
      builder: (context, state) {
        return state.when(
          idle: () => const UserProfileInfo(
            name: 'Loading Name',
            email: 'Loading Email',
          ),
          loading: () => const UserProfileInfo(
            name: 'Loading Name',
            email: 'Loading Email',
          ),
          success: (data) {
            return UserProfileInfo(name: data.fullName, email: data.email);
          },
          error: (error) {
            return UserProfileInfo(name: 'Error Name', email: 'Error Email');
          },
        );
      },
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key, required this.name, required this.email});

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: LightAppColors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: LightAppColors.primary700.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 60.r,
            backgroundColor: LightAppColors.primary500,
            child: Icon(Icons.person, size: 60.r, color: LightAppColors.white),
          ),
        ),

        verticalSpace(24),

        Text(
          name,
          style: AppTextStyles.font24Bold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),

        verticalSpace(8),

        Text(
          email,
          style: AppTextStyles.font16SemiBold.copyWith(
            color: LightAppColors.grey600,
          ),
        ),
      ],
    );
  }
}
