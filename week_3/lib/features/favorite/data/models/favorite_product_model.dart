import 'package:json_annotation/json_annotation.dart';

part 'favorite_product_model.g.dart';

@JsonSerializable()
class FavoriteProductModel {
  String? id;
  String? name;
  String? coverPictureUrl;
  double? price;

  FavoriteProductModel({this.id, this.name, this.coverPictureUrl, this.price});

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteProductModelToJson(this);
}
