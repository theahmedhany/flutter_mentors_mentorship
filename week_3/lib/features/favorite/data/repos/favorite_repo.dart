import 'dart:convert';

import 'package:week_3/core/helpers/shared_pref_helper.dart';
import 'package:week_3/core/networking/api_network_exceptions.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/features/favorite/data/models/favorite_product_model.dart';

class FavoriteRepo {
  static const String _favoriteKey = "favorite_products";

  /// Load all favorite products from local storage
  Future<ApiResult<List<FavoriteProductModel>>> getFavorites() async {
    try {
      final favoritesJson = SharedPrefHelper.getString(key: _favoriteKey);

      if (favoritesJson == null || favoritesJson.isEmpty) {
        return ApiResult.success([]);
      }

      final List<dynamic> decodedJson = json.decode(favoritesJson);
      final favorites = decodedJson
          .map((json) => FavoriteProductModel.fromJson(json))
          .toList();

      return ApiResult.success(favorites);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  /// Add a product to favorites
  Future<ApiResult<List<FavoriteProductModel>>> addToFavorites(
    FavoriteProductModel product,
  ) async {
    try {
      final currentFavoritesResult = await getFavorites();

      if (currentFavoritesResult is Success<List<FavoriteProductModel>>) {
        final currentFavorites = List<FavoriteProductModel>.from(
          currentFavoritesResult.data,
        );

        // Check if product is already in favorites
        final existingIndex = currentFavorites.indexWhere(
          (favorite) => favorite.id == product.id,
        );

        if (existingIndex == -1) {
          currentFavorites.add(product);
          await _saveFavorites(currentFavorites);
        }

        return ApiResult.success(currentFavorites);
      } else {
        return currentFavoritesResult;
      }
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  /// Remove a product from favorites
  Future<ApiResult<List<FavoriteProductModel>>> removeFromFavorites(
    String productId,
  ) async {
    try {
      final currentFavoritesResult = await getFavorites();

      if (currentFavoritesResult is Success<List<FavoriteProductModel>>) {
        final currentFavorites = List<FavoriteProductModel>.from(
          currentFavoritesResult.data,
        );

        currentFavorites.removeWhere((favorite) => favorite.id == productId);

        await _saveFavorites(currentFavorites);
        return ApiResult.success(currentFavorites);
      } else {
        return currentFavoritesResult;
      }
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  /// Toggle favorite status of a product
  Future<ApiResult<List<FavoriteProductModel>>> toggleFavorite(
    FavoriteProductModel product,
  ) async {
    try {
      final currentFavoritesResult = await getFavorites();

      if (currentFavoritesResult is Success<List<FavoriteProductModel>>) {
        final currentFavorites = List<FavoriteProductModel>.from(
          currentFavoritesResult.data,
        );

        final existingIndex = currentFavorites.indexWhere(
          (favorite) => favorite.id == product.id,
        );

        if (existingIndex >= 0) {
          currentFavorites.removeAt(existingIndex);
        } else {
          currentFavorites.add(product);
        }

        await _saveFavorites(currentFavorites);
        return ApiResult.success(currentFavorites);
      } else {
        return currentFavoritesResult;
      }
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  /// Check if a product is in favorites
  Future<ApiResult<bool>> isFavorite(String productId) async {
    try {
      final favoritesResult = await getFavorites();

      if (favoritesResult is Success<List<FavoriteProductModel>>) {
        final isFav = favoritesResult.data.any(
          (favorite) => favorite.id == productId,
        );
        return ApiResult.success(isFav);
      } else {
        return ApiResult.failure(
          ApiNetworkExceptions.getDioException(
            Exception("Failed to check favorite status"),
          ),
        );
      }
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }

  /// Save favorites to local storage
  Future<void> _saveFavorites(List<FavoriteProductModel> favorites) async {
    final jsonString = json.encode(
      favorites.map((product) => product.toJson()).toList(),
    );
    await SharedPrefHelper.setData(key: _favoriteKey, value: jsonString);
  }
}
