import 'package:equatable/equatable.dart';

import '../../data/models/personal_data.dart';

abstract class PersonalDataState extends Equatable {
  const PersonalDataState();

  @override
  List<Object?> get props => [];
}

class PersonalDataInitial extends PersonalDataState {}

class PersonalDataLoaded extends PersonalDataState {
  final PersonalData data;

  const PersonalDataLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class PersonalDataUpdating extends PersonalDataState {}

class PersonalDataUpdated extends PersonalDataState {
  final PersonalData data;

  const PersonalDataUpdated(this.data);

  @override
  List<Object?> get props => [data];
}
