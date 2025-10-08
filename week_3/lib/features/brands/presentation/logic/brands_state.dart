import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'brands_state.freezed.dart';

@freezed
class BrandsState<T> with _$BrandsState<T> {
  const factory BrandsState.idle() = Idle<T>;

  const factory BrandsState.loading() = Loading<T>;

  const factory BrandsState.success(T data) = Success<T>;

  const factory BrandsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
