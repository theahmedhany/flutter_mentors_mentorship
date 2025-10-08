import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/products_models.dart';

class ProductsRepo {
  final ApiServices apiServices;

  ProductsRepo(this.apiServices);

  Future<ApiResult<ProductsModels>> getAllProducts() async {
    try {
      var response = await apiServices.getAllProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
