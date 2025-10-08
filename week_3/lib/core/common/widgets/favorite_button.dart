import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/favorite/data/models/favorite_product_model.dart';
import '../../../features/favorite/presentation/logic/favorite_cubit.dart';
import '../../../features/favorite/presentation/logic/favorite_state.dart';
import '../../theme/app_colors/light_app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.itemId,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  final String itemId;
  final String name;
  final String imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FavoriteCubit,
      FavoriteState<List<FavoriteProductModel>>
    >(
      builder: (context, state) {
        final isFavorite = state.maybeWhen(
          success: (data) => data.any((fav) => fav.id == itemId),
          orElse: () => false,
        );

        return GestureDetector(
          onTap: () {
            final product = FavoriteProductModel(
              id: itemId,
              name: name,
              price: price,
              coverPictureUrl: imageUrl,
            );
            context.read<FavoriteCubit>().toggleFavorite(product);
          },
          child: Container(
            height: 45.r,
            width: 45.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: LightAppColors.grey300,
              border: Border.all(
                color: LightAppColors.primary500,
                width: 1.5.r,
              ),
            ),
            child: Center(
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? LightAppColors.error
                    : LightAppColors.primary500,
                size: 20.r,
              ),
            ),
          ),
        );
      },
    );
  }
}
