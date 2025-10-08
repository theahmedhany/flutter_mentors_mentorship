import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors/light_app_colors.dart';

class MainHomeNavigationBarItem extends StatelessWidget {
  const MainHomeNavigationBarItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.selectedIconPath,
  });

  final String label;
  final IconData iconPath, selectedIconPath;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(iconPath, color: LightAppColors.grey500),
      selectedIcon: Icon(selectedIconPath, color: LightAppColors.primary600),
      label: label,
    );
  }
}
