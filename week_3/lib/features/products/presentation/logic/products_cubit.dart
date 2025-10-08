import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/products_models.dart';
import '../../data/repos/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState<List<ProductItem>>> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(const Idle());

  void emitGetAllProducts() async {
    var data = await productsRepo.getAllProducts();

    data.when(
      success: (ProductsModels productsModels) {
        emit(ProductsState.success(productsModels.items));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          ProductsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }
}
