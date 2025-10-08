// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductModel _$FavoriteProductModelFromJson(
  Map<String, dynamic> json,
) => FavoriteProductModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  coverPictureUrl: json['coverPictureUrl'] as String?,
  price: (json['price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FavoriteProductModelToJson(
  FavoriteProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coverPictureUrl': instance.coverPictureUrl,
  'price': instance.price,
};
