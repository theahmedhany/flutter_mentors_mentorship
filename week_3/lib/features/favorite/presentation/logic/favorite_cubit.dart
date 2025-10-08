import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favorite_product_model.dart';
import '../../data/repos/favorite_repo.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState<List<FavoriteProductModel>>> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit(this.favoriteRepo) : super(const FavoriteState.idle());

  void loadFavorites() async {
    emit(const FavoriteState.loading());
    try {
      final favorites = await favoriteRepo.getFavorites();
      emit(FavoriteState.success(favorites));
    } catch (e) {
      emit(FavoriteState.error(error: 'Failed to load favorites: $e'));
    }
  }

  void toggleFavorite(FavoriteProductModel product) async {
    try {
      final favorites = await favoriteRepo.toggleFavorite(product);
      emit(FavoriteState.success(favorites));
    } catch (e) {
      emit(FavoriteState.error(error: 'Failed to toggle favorite: $e'));
    }
  }

  bool isFavorite(String productId) {
    return state.maybeWhen(
      success: (data) => data.any((fav) => fav.id == productId),
      orElse: () => false,
    );
  }

  List<FavoriteProductModel> getCurrentFavorites() {
    return state.maybeWhen(success: (data) => data, orElse: () => []);
  }
}
