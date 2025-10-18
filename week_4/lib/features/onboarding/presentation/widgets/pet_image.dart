import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetImageWidget extends StatelessWidget {
  const PetImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset('assets/images/onboarding.png'),
    );
  }
}
