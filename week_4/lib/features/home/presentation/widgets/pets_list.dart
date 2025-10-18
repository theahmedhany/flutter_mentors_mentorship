import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/breed_model.dart';
import 'pet_card.dart';

class PetsList extends StatelessWidget {
  final List<BreedModel> breeds;

  const PetsList({super.key, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        return PetCard(breed: breeds[index]);
      },
    );
  }
}
