import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/networking/api_error_model.dart';
import 'package:week_3/core/networking/api_network_exceptions.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/features/details/data/models/product_details_model.dart';
import 'package:week_3/features/details/data/repos/product_details_repo.dart';

import 'product_details_state.dart';

class ProductDetailsCubit
    extends Cubit<ProductDetailsState<ProductDetailsModel>> {
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsCubit(this.productDetailsRepo) : super(const Idle());

  void emitGetProductDetails(String productId) async {
    var data = await productDetailsRepo.getProductDetails(productId);
    data.when(
      success: (ProductDetailsModel productDetails) {
        emit(ProductDetailsState.success(productDetails));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(
          ProductDetailsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiErrorModel),
          ),
        );
      },
    );
  }
}
