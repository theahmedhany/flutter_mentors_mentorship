// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['life_span'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
      weight: json['weight'] == null
          ? null
          : Weight.fromJson(json['weight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'reference_image_id': instance.referenceImageId,
      'weight': instance.weight,
    };

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
      imperial: json['imperial'] as String?,
      metric: json['metric'] as String?,
    );

Map<String, dynamic> _$WeightToJson(Weight instance) => <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
