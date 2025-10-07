import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, required this.size, this.loadingAnimation});

  final double size;
  final String? loadingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
