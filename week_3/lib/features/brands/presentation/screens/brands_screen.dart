import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_loading.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/brands/data/models/brands_model.dart';
import 'package:week_3/features/brands/presentation/logic/brands_cubit.dart';
import 'package:week_3/features/brands/presentation/logic/brands_state.dart';
import 'package:week_3/features/brands/presentation/widgets/brand_card.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      appBar: AppBar(
        title: Text(
          'All Brands',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
        backgroundColor: LightAppColors.background,
        iconTheme: const IconThemeData(color: LightAppColors.grey900),
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<BrandsCubit, BrandsState<List<CategoryModel>>>(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CustomLoading()),
            loading: () => const Center(child: CustomLoading()),
            success: (data) {
              return ListView.separated(
                itemCount: data.length,
                padding: EdgeInsets.all(20.w),
                separatorBuilder: (context, index) => verticalSpace(16),
                itemBuilder: (context, index) {
                  final category = data[index];
                  return BrandCard(
                    name: category.name,
                    description: category.description,
                    imageUrl: category.coverPictureUrl,
                  );
                },
              );
            },
            error: (error) => Center(
              child: Text(
                error.message.toString(),
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.error,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
