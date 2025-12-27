import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../cubit/personal_data_cubit.dart';
import '../cubit/personal_data_state.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Personal Data'),
        ),
        body: BlocBuilder<PersonalDataCubit, PersonalDataState>(
          builder: (context, state) {
            if (state is PersonalDataLoaded || state is PersonalDataUpdated) {
              final data = state is PersonalDataLoaded
                  ? state.data
                  : (state as PersonalDataUpdated).data;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Profile Picture
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                data.name.substring(0, 1),
                                style: AppTextStyles.h1.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: AppColors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Your Name
                    CustomTextField(
                      label: 'Your Name',
                      initialValue: data.name,
                      onChanged: (value) {
                        context.read<PersonalDataCubit>().updateField(
                          name: value,
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Date of Birth
                    CustomTextField(
                      label: 'Date of Birth',
                      initialValue: data.dateOfBirth != null
                          ? DateFormat('dd MMMM yyyy').format(data.dateOfBirth!)
                          : '',
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textHint,
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: data.dateOfBirth ?? DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          // ignore: use_build_context_synchronously
                          context.read<PersonalDataCubit>().updateField(
                            dateOfBirth: date,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),

                    // Your Job
                    CustomTextField(
                      label: 'Your Job',
                      initialValue: data.job,
                      onChanged: (value) {
                        context.read<PersonalDataCubit>().updateField(
                          job: value,
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Monthly Income
                    CustomTextField(
                      label: 'Monthly Income',
                      initialValue: data.monthlyIncome,
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textHint,
                      ),
                      onTap: () {
                        _showIncomeBottomSheet(context);
                      },
                    ),
                    const SizedBox(height: 24),

                    // Gender Selection
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _GenderOption(
                                label: 'Male',
                                isSelected: data.gender == 'Male',
                                onTap: () {
                                  context.read<PersonalDataCubit>().updateField(
                                    gender: 'Male',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _GenderOption(
                                label: 'Female',
                                isSelected: data.gender == 'Female',
                                onTap: () {
                                  context.read<PersonalDataCubit>().updateField(
                                    gender: 'Female',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _showIncomeBottomSheet(BuildContext context) {
    final incomeRanges = [
      '\$500 - \$1000 / year',
      '\$1000 - \$2000 / year',
      '\$2000 - \$3000 / year',
      '\$3000 - \$5000 / year',
      '\$5000+ / year',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bottomSheetContext) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Monthly Income', style: AppTextStyles.h3),
              const SizedBox(height: 20),
              ...incomeRanges.map((income) {
                return InkWell(
                  onTap: () {
                    context.read<PersonalDataCubit>().updateField(
                      monthlyIncome: income,
                    );
                    Navigator.pop(bottomSheetContext);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.divider, width: 1),
                      ),
                    ),
                    child: Text(income, style: AppTextStyles.bodyLarge),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _GenderOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        color: AppColors.white,
                        size: 8,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
