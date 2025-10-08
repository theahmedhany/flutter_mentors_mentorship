import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/user_profile_model.dart';
import '../../data/repos/user_profile_repo.dart';
import 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState<UserProfileModel>> {
  final UserProfileRepo userProfileRepo;

  UserProfileCubit(this.userProfileRepo) : super(const Idle());

  void emitGetUserProfile() async {
    var data = await userProfileRepo.getUserProfile();

    data.when(
      success: (UserProfileModel userProfileModel) {
        emit(UserProfileState.success(userProfileModel));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          UserProfileState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }
}
