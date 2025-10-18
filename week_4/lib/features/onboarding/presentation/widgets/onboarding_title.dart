import 'package:flutter/material.dart';

class OnboardingTitle extends StatelessWidget {
  final String title;

  const OnboardingTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        height: 1.2,
      ),
    );
  }
}
