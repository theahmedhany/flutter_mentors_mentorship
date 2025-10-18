import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getBreeds({int limit = 20, int page = 0}) async {
    emit(const HomeState.loading());
    final result = await _homeRepo.getBreeds(limit, page);
    result.when(
      success: (breeds) {
        emit(HomeState.success(breeds));
      },
      failure: (error) {
        emit(HomeState.error(error.message));
      },
    );
  }
}
