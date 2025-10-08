import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState<T> with _$UserProfileState<T> {
  const factory UserProfileState.idle() = Idle<T>;

  const factory UserProfileState.loading() = Loading<T>;

  const factory UserProfileState.success(T data) = Success<T>;

  const factory UserProfileState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
