import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/custom_loading.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../data/models/favorite_product_model.dart';
import '../logic/favorite_cubit.dart';
import '../logic/favorite_state.dart';
import '../widgets/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child:
          BlocBuilder<FavoriteCubit, FavoriteState<List<FavoriteProductModel>>>(
            builder: (context, state) {
              return state.when(
                idle: () => const Center(child: CustomLoading()),
                loading: () => Center(child: CustomLoading()),
                success: (data) {
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        "There are no favorite items yet.",
                        style: AppTextStyles.font18Regular.copyWith(
                          color: LightAppColors.primary500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.r,
                      horizontal: 16.r,
                    ),
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.r),
                        child: FavoriteCard(product: product),
                      );
                    },
                  );
                },
                error: (error) => Center(
                  child: Text(
                    error,
                    style: AppTextStyles.font18Regular.copyWith(
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
