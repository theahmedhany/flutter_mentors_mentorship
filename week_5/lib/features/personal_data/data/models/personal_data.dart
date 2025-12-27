import 'package:equatable/equatable.dart';

class PersonalData extends Equatable {
  final String name;
  final DateTime? dateOfBirth;
  final String job;
  final String monthlyIncome;
  final String gender;

  const PersonalData({
    required this.name,
    this.dateOfBirth,
    required this.job,
    required this.monthlyIncome,
    required this.gender,
  });

  PersonalData copyWith({
    String? name,
    DateTime? dateOfBirth,
    String? job,
    String? monthlyIncome,
    String? gender,
  }) {
    return PersonalData(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      job: job ?? this.job,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [name, dateOfBirth, job, monthlyIncome, gender];
}
