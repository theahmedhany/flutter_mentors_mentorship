import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/features/details/presentation/widgets/product_description.dart';
import 'package:week_3/features/details/presentation/widgets/product_details_header.dart';
import 'package:week_3/features/details/presentation/widgets/product_details_image.dart';
import 'package:week_3/features/details/presentation/widgets/product_details_size_guideline.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Map<String, dynamic> product = {
    "id": "88d97d61-b332-4493-bd0b-6276884c0f39",
    "productCode": "PRD-20250731-322413",
    "name": "Men's Gold Wedding Band",
    "description":
        "A simple yet sophisticated 18k gold wedding band for men with a comfortable fit.",
    "nameArabic": "خاتم زواج ذهبي للرجال",
    "descriptionArabic":
        "خاتم زواج ذهبي عيار 18 للرجال، بسيط وأنيق ومريح عند الارتداء.",
    "coverPictureUrl": "https://jewellery.theknight.tech/men-gold-ring.png",
    "productPictures": [
      "https://i.dummyjson.com/data/products/80/2.jpg",
      "https://i.dummyjson.com/data/products/80/3.jpg",
    ],
    "categories": [],
    "price": 750,
    "stock": 119,
    "weight": 9,
    "color": "Gold",
    "discountPercentage": 15,
    "rating": 2.7866666,
    "reviewsCount": 15,
    "sellerId": "eab68d32-5f9c-4eb2-61c7-08ddccead94a",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsImage(imageSrc: product['coverPictureUrl']),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsHeader(product: product, discountedPrice: 100),

                  verticalSpace(16),

                  const ProductDetailsSizeGuideline(),

                  verticalSpace(16),

                  ProductDescription(description: product['description']),

                  verticalSpace(80),

                  CustomAppButton(onPress: () {}, text: 'Add to cart'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
