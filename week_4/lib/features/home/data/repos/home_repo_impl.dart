import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repos/home_repo.dart';
import '../apis/home_api_service.dart';
import '../models/breed_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImpl(this._homeApiService);

  @override
  Future<ApiResult<List<BreedModel>>> getBreeds(int limit, int page) async {
    try {
      final response = await _homeApiService.getBreeds(limit, page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
