import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_3/features/favorite/presentation/widgets/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Product> products = [
    Product(
      name: "Men's Tie-Dye T-Shirt",
      brand: "Nike Sportswear",
      price: 45.00,
      discount: 4.00,
      image: "assets/shirt.png",
      quantity: 1,
    ),
    Product(
      name: "Women's Running Shoes",
      brand: "Adidas Performance",
      price: 89.99,
      discount: 10.00,
      image: "assets/shoes.png",
      quantity: 1,
    ),
    Product(
      name: "Classic Denim Jacket",
      brand: "Levi's",
      price: 120.00,
      discount: 15.00,
      image: "assets/jacket.png",
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FavoriteCard(product: products[index]);
        },
      ),
    );
  }
}

class Product {
  String name;
  String brand;
  double price;
  double discount;
  String image;
  int quantity;

  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.discount,
    required this.image,
    required this.quantity,
  });
}
