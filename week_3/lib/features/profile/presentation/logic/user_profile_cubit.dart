import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/features/profile/data/models/user_profile_model.dart';
import 'package:week_3/features/profile/data/repos/user_profile_repo.dart';
import 'package:week_3/features/profile/presentation/logic/user_profile_state.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';

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
