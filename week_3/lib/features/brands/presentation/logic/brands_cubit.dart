import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/brands_model.dart';
import '../../data/repos/brands_repo.dart';
import 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState<List<CategoryModel>>> {
  final BrandsRepo brandsRepo;

  BrandsCubit(this.brandsRepo) : super(const Idle());

  void emitGetAllBrands() async {
    var data = await brandsRepo.getAllBrands();

    data.when(
      success: (BrandsModel brandsModel) {
        emit(BrandsState.success(brandsModel.categories));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          BrandsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }
}
