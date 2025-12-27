import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/menu_tile.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            // Profile Header
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  // Avatar
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.profile.name.substring(0, 1),
                                        style: AppTextStyles.h2.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Name and Type
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.profile.name,
                                          style: AppTextStyles.h4,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          state.profile.investorType,
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: AppColors.textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Menu Items
                            MenuTile(
                              icon: Icons.person_outline,
                              title: 'Personal Data',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouter.personalData,
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.settings_outlined,
                              title: 'Settings',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.description_outlined,
                              title: 'E-Statement',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.card_giftcard_outlined,
                              title: 'Referral Code',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.help_outline,
                              title: 'FAQs',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.book_outlined,
                              title: 'Our Handbook',
                              onTap: () {},
                            ),
                            const SizedBox(height: 12),
                            MenuTile(
                              icon: Icons.groups_outlined,
                              title: 'Community',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouter.community,
                                );
                              },
                            ),
                            const SizedBox(height: 24),

                            // Help Banner
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.headset_mic_outlined,
                                      color: AppColors.primary,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      'Feel Free to Ask, We Ready to Help',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Navigation
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowLight,
                            blurRadius: 20,
                            offset: const Offset(0, -4),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _NavigationItem(
                                icon: Icons.home_outlined,
                                isActive: false,
                                onTap: () {},
                              ),
                              _NavigationItem(
                                icon: Icons.article_outlined,
                                isActive: false,
                                onTap: () {},
                              ),
                              _NavigationItem(
                                icon: Icons.mail_outline,
                                isActive: false,
                                onTap: () {},
                              ),
                              _NavigationItem(
                                icon: Icons.person,
                                isActive: true,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          color: isActive ? AppColors.primary : AppColors.textHint,
          size: isActive ? 28 : 24,
        ),
      ),
    );
  }
}
