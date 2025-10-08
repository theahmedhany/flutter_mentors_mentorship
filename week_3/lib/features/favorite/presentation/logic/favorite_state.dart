import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState<T> with _$FavoriteState<T> {
  const factory FavoriteState.idle() = Idle<T>;

  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.success(T data) = Success<T>;
  const factory FavoriteState.error({required String error}) = Error;
}
