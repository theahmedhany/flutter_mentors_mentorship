import 'package:json_annotation/json_annotation.dart';

part 'breed_model.g.dart';

@JsonSerializable()
class BreedModel {
  final String id;
  final String name;
  final String? temperament;
  final String? origin;
  final String? description;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  final Weight? weight;

  BreedModel({
    required this.id,
    required this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.referenceImageId,
    this.weight,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}

@JsonSerializable()
class Weight {
  final String? imperial;
  final String? metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
