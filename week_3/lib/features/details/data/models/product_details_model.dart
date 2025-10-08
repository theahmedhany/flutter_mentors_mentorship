import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailsModel {
  final String id;
  final String productCode;
  final String name;
  final String description;
  final String nameArabic;
  final String descriptionArabic;
  final String coverPictureUrl;
  final List<String>? productPictures;
  final List<String> categories;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final double discountPercentage;
  final double rating;
  final int reviewsCount;
  final String sellerId;

  ProductDetailsModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.nameArabic,
    required this.descriptionArabic,
    required this.coverPictureUrl,
    this.productPictures,
    required this.categories,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    required this.sellerId,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
