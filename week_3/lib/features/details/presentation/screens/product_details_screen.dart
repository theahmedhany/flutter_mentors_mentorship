import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/custom_app_button.dart';
import '../../../../core/common/widgets/custom_loading.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../data/models/product_details_model.dart';
import '../logic/product_details_cubit.dart';
import '../logic/product_details_state.dart';
import '../widgets/product_description.dart';
import '../widgets/product_details_header.dart';
import '../widgets/product_details_image.dart';
import '../widgets/product_details_size_guideline.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: SingleChildScrollView(
        child:
            BlocBuilder<
              ProductDetailsCubit,
              ProductDetailsState<ProductDetailsModel>
            >(
              builder: (context, state) {
                return state.when(
                  idle: () => Column(
                    children: [
                      verticalSpace(200),
                      const Center(child: CustomLoading()),
                    ],
                  ),
                  loading: () => Column(
                    children: [
                      verticalSpace(200),
                      const Center(child: CustomLoading()),
                    ],
                  ),
                  success: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailsImage(item: data),

                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductDetailsHeader(
                                product: data,
                                discountedPrice: 100,
                              ),

                              verticalSpace(16),

                              const ProductDetailsSizeGuideline(),

                              verticalSpace(16),

                              ProductDescription(description: data.description),

                              verticalSpace(80),

                              CustomAppButton(
                                onPress: () {
                                  //TODO: Add to cart functionality
                                },
                                text: 'Add to cart',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error) => Center(
                    child: Text(
                      error.message.toString(),
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.error,
                      ),
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
