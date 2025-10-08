import 'dart:convert';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../models/favorite_product_model.dart';

class FavoriteRepo {
  static const String _favoriteKey = "favorite_products";

  Future<List<FavoriteProductModel>> getFavorites() async {
    try {
      final favoritesJson = SharedPrefHelper.getString(key: _favoriteKey);
      if (favoritesJson == null || favoritesJson.isEmpty) return [];

      final List<dynamic> decodedJson = json.decode(favoritesJson);
      return decodedJson
          .map((json) => FavoriteProductModel.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<FavoriteProductModel>> toggleFavorite(
    FavoriteProductModel product,
  ) async {
    final favorites = await getFavorites();
    final existingIndex = favorites.indexWhere((fav) => fav.id == product.id);

    if (existingIndex >= 0) {
      favorites.removeAt(existingIndex);
    } else {
      favorites.add(product);
    }

    await _saveFavorites(favorites);
    return favorites;
  }

  Future<bool> isFavorite(String productId) async {
    final favorites = await getFavorites();
    return favorites.any((fav) => fav.id == productId);
  }

  Future<void> _saveFavorites(List<FavoriteProductModel> favorites) async {
    final jsonString = json.encode(
      favorites.map((fav) => fav.toJson()).toList(),
    );
    await SharedPrefHelper.setData(key: _favoriteKey, value: jsonString);
  }
}
