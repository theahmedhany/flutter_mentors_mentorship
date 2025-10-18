import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/breed_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(List<BreedModel> breeds) = Success;
  const factory HomeState.error(String message) = Error;
}
