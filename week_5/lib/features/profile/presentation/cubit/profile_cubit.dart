import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_profile.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    _loadProfile();
  }

  void _loadProfile() {
    // In a real app, this would fetch from an API or database
    const profile = UserProfile(
      name: 'William John Malik',
      investorType: 'Aggressive Investor',
    );
    emit(ProfileLoaded(profile));
  }

  void updateProfile(UserProfile profile) {
    emit(ProfileLoaded(profile));
  }
}
