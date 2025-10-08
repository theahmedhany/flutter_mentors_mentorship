import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../brands/data/models/brands_model.dart';
import '../../../brands/presentation/logic/brands_cubit.dart';
import '../../../brands/presentation/logic/brands_state.dart';
import 'brand_list_shimmer_loading.dart';
import 'home_brand_list_item.dart';

class HomeBrandList extends StatelessWidget {
  const HomeBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: BlocBuilder<BrandsCubit, BrandsState<List<CategoryModel>>>(
        builder: (context, state) {
          return state.when(
            idle: () => BrandListShimmerLoading(),
            loading: () => BrandListShimmerLoading(),
            success: (data) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                separatorBuilder: (context, index) => horizontalSpace(8),
                itemBuilder: (context, index) {
                  final category = data[index];
                  return HomeBrandListItem(
                    imagePath: category.coverPictureUrl,
                    brandName: category.name,
                  );
                },
              );
            },
            error: (error) =>
                BrandListShimmerLoading(baseColor: LightAppColors.error),
          );
        },
      ),
    );
  }
}
