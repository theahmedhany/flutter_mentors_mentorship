import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String name;
  final String investorType;
  final String? avatarUrl;

  const UserProfile({
    required this.name,
    required this.investorType,
    this.avatarUrl,
  });

  UserProfile copyWith({
    String? name,
    String? investorType,
    String? avatarUrl,
  }) {
    return UserProfile(
      name: name ?? this.name,
      investorType: investorType ?? this.investorType,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  List<Object?> get props => [name, investorType, avatarUrl];
}
