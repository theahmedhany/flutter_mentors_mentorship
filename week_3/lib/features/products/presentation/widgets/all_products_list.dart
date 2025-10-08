import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/custom_product_card.dart';
import '../../../../core/common/widgets/products_shimmer_loading.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../data/models/products_models.dart';
import '../logic/products_cubit.dart';
import '../logic/products_state.dart';

class AllProductsList extends StatelessWidget {
  const AllProductsList({super.key, this.physics, this.wrap});

  final ScrollPhysics? physics;
  final bool? wrap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState<List<ProductItem>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: ProductsShimmerLoading()),
          loading: () => const Center(child: ProductsShimmerLoading()),
          success: (data) {
            return GridView.builder(
              physics: physics ?? const BouncingScrollPhysics(),
              shrinkWrap: wrap ?? false,
              padding: EdgeInsets.symmetric(vertical: 16.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 290.h,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                return CustomProductCard(
                  product: product,
                  onTap: () {
                    context.pushNamed(
                      Routes.productDetailsScreen,
                      arguments: product.id,
                    );
                  },
                );
              },
            );
          },
          error: (error) =>
              ProductsShimmerLoading(baseColor: LightAppColors.error),
        );
      },
    );
  }
}
