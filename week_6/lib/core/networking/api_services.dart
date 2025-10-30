import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:week_6/features/home/data/models/all_movies_model.dart';

import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // All Movies API
  @GET(ApiConstants.apiAllMovies)
  Future<AllMoviesModel> allMovies(@Query('page') String page);
}
