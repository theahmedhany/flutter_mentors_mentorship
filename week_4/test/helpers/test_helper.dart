import 'package:week_4/features/home/data/models/breed_model.dart';

class TestHelper {
  static BreedModel mockBreed({
    String id = 'abys',
    String name = 'Abyssinian',
    String? temperament = 'Active, Energetic',
    String? origin = 'Egypt',
    String? description = 'A friendly cat',
    String? lifeSpan = '14 - 15',
    String? referenceImageId = '0XYvRd7oD',
  }) {
    return BreedModel(
      id: id,
      name: name,
      temperament: temperament,
      origin: origin,
      description: description,
      lifeSpan: lifeSpan,
      referenceImageId: referenceImageId,
      weight: Weight(imperial: '7 - 10', metric: '3 - 5'),
    );
  }

  static List<BreedModel> mockBreedList({int count = 3}) {
    return List.generate(
      count,
      (index) => mockBreed(
        id: 'breed_$index',
        name: 'Breed $index',
        origin: 'Country $index',
      ),
    );
  }

  static Map<String, dynamic> mockBreedJson({
    String id = 'abys',
    String name = 'Abyssinian',
  }) {
    return {
      'id': id,
      'name': name,
      'temperament': 'Active, Energetic',
      'origin': 'Egypt',
      'description': 'A friendly cat',
      'life_span': '14 - 15',
      'reference_image_id': '0XYvRd7oD',
      'weight': {'imperial': '7 - 10', 'metric': '3 - 5'},
    };
  }
}
