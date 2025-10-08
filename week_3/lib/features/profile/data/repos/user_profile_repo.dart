import 'package:week_3/features/profile/data/models/user_profile_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class UserProfileRepo {
  final ApiServices apiServices;

  UserProfileRepo(this.apiServices);

  Future<ApiResult<UserProfileModel>> getUserProfile() async {
    try {
      var response = await apiServices.getUserProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
