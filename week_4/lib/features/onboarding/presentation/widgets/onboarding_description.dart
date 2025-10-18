import 'package:flutter/material.dart';

class OnboardingDescription extends StatelessWidget {
  final String description;

  const OnboardingDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
    );
  }
}
