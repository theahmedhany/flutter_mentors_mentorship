import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/personal_data.dart';
import 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial()) {
    _loadPersonalData();
  }

  void _loadPersonalData() {
    final data = PersonalData(
      name: 'William John Malik',
      dateOfBirth: DateTime(1999, 12, 24),
      job: 'Successor Designer',
      monthlyIncome: '\$500 - \$3000 / year',
      gender: 'Male',
    );
    emit(PersonalDataLoaded(data));
  }

  void updateField({
    String? name,
    DateTime? dateOfBirth,
    String? job,
    String? monthlyIncome,
    String? gender,
  }) {
    if (state is PersonalDataLoaded) {
      final currentData = (state as PersonalDataLoaded).data;
      final updatedData = currentData.copyWith(
        name: name,
        dateOfBirth: dateOfBirth,
        job: job,
        monthlyIncome: monthlyIncome,
        gender: gender,
      );
      emit(PersonalDataLoaded(updatedData));
    }
  }

  void savePersonalData() async {
    if (state is PersonalDataLoaded) {
      final data = (state as PersonalDataLoaded).data;
      emit(PersonalDataUpdating());

      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      emit(PersonalDataUpdated(data));
    }
  }
}
