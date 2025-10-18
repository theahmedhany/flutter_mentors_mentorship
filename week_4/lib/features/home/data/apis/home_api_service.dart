import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/breed_model.dart';
import 'home_api_endpoints.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiEndpoints.breeds)
  Future<List<BreedModel>> getBreeds(
    @Query('limit') int limit,
    @Query('page') int page,
  );
}
