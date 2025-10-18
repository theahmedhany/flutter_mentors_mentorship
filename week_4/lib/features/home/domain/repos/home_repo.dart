import '../../../../core/networking/api_result.dart';
import '../../data/models/breed_model.dart';

abstract class HomeRepo {
  Future<ApiResult<List<BreedModel>>> getBreeds(int limit, int page);
}
