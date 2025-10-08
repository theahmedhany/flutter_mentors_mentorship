import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState<T> with _$FavoriteState<T> {
  const factory FavoriteState.idle() = Idle<T>;

  const factory FavoriteState.loading() = Loading<T>;

  const factory FavoriteState.success(T data) = Success<T>;

  const factory FavoriteState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
