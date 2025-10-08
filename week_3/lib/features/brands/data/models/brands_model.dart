import 'package:json_annotation/json_annotation.dart';

part 'brands_model.g.dart';

@JsonSerializable()
class BrandsModel {
  final List<CategoryModel> categories;

  BrandsModel({required this.categories});

  factory BrandsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
