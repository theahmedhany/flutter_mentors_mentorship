import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../widgets/profile_info.dart';
import '../widgets/profile_menu_section.dart';
import '../widgets/profile_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            verticalSpace(32),
            ProfileInfo(),
            verticalSpace(24),
            ProfileStats(),
            verticalSpace(24),
            ProfileMenuSection(),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
