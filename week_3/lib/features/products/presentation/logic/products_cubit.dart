import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/features/products/data/models/products_models.dart';
import 'package:week_3/features/products/data/repos/products_repo.dart';
import 'package:week_3/features/products/presentation/logic/products_state.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';

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
