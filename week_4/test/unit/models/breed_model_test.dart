import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/features/home/data/models/breed_model.dart';

import '../../helpers/test_helper.dart';

void main() {
  group('BreedModel', () {
    test('should create a BreedModel instance', () {
      final breed = TestHelper.mockBreed();

      expect(breed.id, 'abys');
      expect(breed.name, 'Abyssinian');
      expect(breed.temperament, 'Active, Energetic');
      expect(breed.origin, 'Egypt');
      expect(breed.description, 'A friendly cat');
      expect(breed.lifeSpan, '14 - 15');
      expect(breed.referenceImageId, '0XYvRd7oD');
      expect(breed.weight, isNotNull);
      expect(breed.weight?.imperial, '7 - 10');
      expect(breed.weight?.metric, '3 - 5');
    });

    test('should create BreedModel from JSON', () {
      final json = TestHelper.mockBreedJson();
      final breed = BreedModel.fromJson(json);

      expect(breed.id, 'abys');
      expect(breed.name, 'Abyssinian');
      expect(breed.temperament, 'Active, Energetic');
      expect(breed.origin, 'Egypt');
      expect(breed.description, 'A friendly cat');
      expect(breed.lifeSpan, '14 - 15');
      expect(breed.referenceImageId, '0XYvRd7oD');
      expect(breed.weight, isNotNull);
    });

    test('should convert BreedModel to JSON', () {
      final breed = TestHelper.mockBreed();
      final json = breed.toJson();

      expect(json['id'], 'abys');
      expect(json['name'], 'Abyssinian');
      expect(json['temperament'], 'Active, Energetic');
      expect(json['origin'], 'Egypt');
      expect(json['description'], 'A friendly cat');
      expect(json['life_span'], '14 - 15');
      expect(json['reference_image_id'], '0XYvRd7oD');
      expect(json['weight'], isNotNull);
      expect(json['weight']['imperial'], '7 - 10');
    });

    test('should handle null values in BreedModel', () {
      final breed = BreedModel(id: 'test', name: 'Test Breed');

      expect(breed.id, 'test');
      expect(breed.name, 'Test Breed');
      expect(breed.temperament, isNull);
      expect(breed.origin, isNull);
      expect(breed.description, isNull);
      expect(breed.lifeSpan, isNull);
      expect(breed.referenceImageId, isNull);
      expect(breed.weight, isNull);
    });
  });

  group('Weight', () {
    test('should create a Weight instance', () {
      final weight = Weight(imperial: '7 - 10', metric: '3 - 5');

      expect(weight.imperial, '7 - 10');
      expect(weight.metric, '3 - 5');
    });

    test('should create Weight from JSON', () {
      final json = {'imperial': '7 - 10', 'metric': '3 - 5'};
      final weight = Weight.fromJson(json);

      expect(weight.imperial, '7 - 10');
      expect(weight.metric, '3 - 5');
    });

    test('should convert Weight to JSON', () {
      final weight = Weight(imperial: '7 - 10', metric: '3 - 5');
      final json = weight.toJson();

      expect(json['imperial'], '7 - 10');
      expect(json['metric'], '3 - 5');
    });
  });
}
