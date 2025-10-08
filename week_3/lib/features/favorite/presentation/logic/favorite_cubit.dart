import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/networking/api_error_model.dart';
import 'package:week_3/core/networking/api_network_exceptions.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/features/favorite/data/models/favorite_product_model.dart';
import 'package:week_3/features/favorite/data/repos/favorite_repo.dart';
import 'package:week_3/features/favorite/presentation/logic/favorite_state.dart'
    as favorite_state;

class FavoriteCubit
    extends Cubit<favorite_state.FavoriteState<List<FavoriteProductModel>>> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit(this.favoriteRepo)
    : super(const favorite_state.FavoriteState.idle());

  /// Load all favorite products
  void loadFavorites() async {
    emit(const favorite_state.FavoriteState.loading());

    final result = await favoriteRepo.getFavorites();

    result.when(
      success: (List<FavoriteProductModel> favorites) {
        emit(favorite_state.FavoriteState.success(favorites));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          favorite_state.FavoriteState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }

  /// Toggle favorite status of a product
  void toggleFavorite(FavoriteProductModel product) async {
    emit(const favorite_state.FavoriteState.loading());

    final result = await favoriteRepo.toggleFavorite(product);

    result.when(
      success: (List<FavoriteProductModel> favorites) {
        emit(favorite_state.FavoriteState.success(favorites));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          favorite_state.FavoriteState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }

  /// Add a product to favorites
  void addToFavorites(FavoriteProductModel product) async {
    emit(const favorite_state.FavoriteState.loading());

    final result = await favoriteRepo.addToFavorites(product);

    result.when(
      success: (List<FavoriteProductModel> favorites) {
        emit(favorite_state.FavoriteState.success(favorites));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          favorite_state.FavoriteState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }

  /// Remove a product from favorites
  void removeFromFavorites(String productId) async {
    emit(const favorite_state.FavoriteState.loading());

    final result = await favoriteRepo.removeFromFavorites(productId);

    result.when(
      success: (List<FavoriteProductModel> favorites) {
        emit(favorite_state.FavoriteState.success(favorites));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          favorite_state.FavoriteState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }

  /// Check if a product is in favorites
  /// Note: This is a synchronous method that works with current state
  bool isFavorite(String productId) {
    final currentState = state;
    if (currentState is favorite_state.Success<List<FavoriteProductModel>>) {
      return currentState.data.any((product) => product.id == productId);
    }
    return false;
  }

  /// Get current favorites list
  List<FavoriteProductModel> getCurrentFavorites() {
    final currentState = state;
    if (currentState is favorite_state.Success<List<FavoriteProductModel>>) {
      return currentState.data;
    }
    return [];
  }
}
