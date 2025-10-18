import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/core/helpers/extensions.dart';

void main() {
  group('ImageUrlX Extension', () {
    test('should convert reference image ID to full image URL', () {
      const referenceImageId = '0XYvRd7oD';
      final imageUrl = referenceImageId.toImageUrl();

      expect(imageUrl, 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg');
    });

    test('should handle empty string', () {
      const referenceImageId = '';
      final imageUrl = referenceImageId.toImageUrl();

      expect(imageUrl, 'https://cdn2.thecatapi.com/images/.jpg');
    });

    test('should handle special characters in image ID', () {
      const referenceImageId = 'abc-123_XYZ';
      final imageUrl = referenceImageId.toImageUrl();

      expect(imageUrl, 'https://cdn2.thecatapi.com/images/abc-123_XYZ.jpg');
    });

    test('should maintain exact image ID format', () {
      const referenceImageId = 'Test_Image-123';
      final imageUrl = referenceImageId.toImageUrl();

      expect(imageUrl, 'https://cdn2.thecatapi.com/images/Test_Image-123.jpg');
    });
  });
}
