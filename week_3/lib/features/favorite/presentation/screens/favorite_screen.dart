import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/favorite/data/models/favorite_product_model.dart';
import 'package:week_3/features/favorite/presentation/logic/favorite_cubit.dart';
import 'package:week_3/features/favorite/presentation/logic/favorite_state.dart'
    as favorite_state;

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
          BlocBuilder<
            FavoriteCubit,
            favorite_state.FavoriteState<List<FavoriteProductModel>>
          >(
            builder: (context, state) {
              // Handle different states
              if (state is favorite_state.Loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is favorite_state.Error) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Failed to load favorites",
                        style: AppTextStyles.font18Regular.copyWith(
                          color: LightAppColors.error,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          context.read<FavoriteCubit>().loadFavorites();
                        },
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              // Handle success state
              List<FavoriteProductModel> favoriteProducts = [];
              if (state is favorite_state.Success<List<FavoriteProductModel>>) {
                favoriteProducts = state.data;
              }

              if (favoriteProducts.isEmpty) {
                return Center(
                  child: Text(
                    "There are no favorite items yet.",
                    style: AppTextStyles.font18Regular.copyWith(
                      color: LightAppColors.grey500,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: favoriteProducts.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.r),
                    child: FavoriteCard(product: product),
                  );
                },
              );
            },
          ),
    );
  }
}
