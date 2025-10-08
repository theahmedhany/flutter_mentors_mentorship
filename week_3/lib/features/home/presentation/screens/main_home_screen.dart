import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../favorite/presentation/screens/favorite_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../widgets/main_home_navigation_bar_item.dart';
import 'home_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: _pages[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: LightAppColors.grey0,
        indicatorColor: LightAppColors.primary500.withValues(alpha: 0.3),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
          Set<WidgetState> states,
        ) {
          final bool isSelected = states.contains(WidgetState.selected);
          return AppTextStyles.font14Regular.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? LightAppColors.primary600
                : LightAppColors.grey500,
          );
        }),

        destinations: const [
          MainHomeNavigationBarItem(
            label: 'Home',
            iconPath: Icons.home_outlined,
            selectedIconPath: Icons.home,
          ),
          MainHomeNavigationBarItem(
            label: 'Favorites',
            iconPath: Icons.favorite_outline,
            selectedIconPath: Icons.favorite,
          ),
          MainHomeNavigationBarItem(
            label: 'Profile',
            iconPath: Icons.person_outline,
            selectedIconPath: Icons.person,
          ),
        ],
      ),
    );
  }
}
