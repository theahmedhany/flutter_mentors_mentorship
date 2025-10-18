import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_header.dart';
import '../widgets/pets_list.dart';
import '../widgets/search_bar_with_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            const HomeHeader(),
            verticalSpace(20),
            const SearchBarWithFilter(),
            verticalSpace(24),
            const CategoriesSection(),
            verticalSpace(20),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainTeal,
                      ),
                    ),
                    success: (breeds) => PetsList(breeds: breeds),
                    error: (message) => Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64.sp,
                              color: AppColors.red,
                            ),
                            verticalSpace(16),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.darkGray,
                              ),
                            ),
                            verticalSpace(16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<HomeCubit>().getBreeds();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainTeal,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32.w,
                                  vertical: 12.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                'Retry',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0, onTap: (index) {}),
    );
  }
}
