import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  final String userId;
  final String email;
  final String fullName;
  final String? profilePicture;

  UserProfileModel({
    required this.userId,
    required this.email,
    required this.fullName,
    this.profilePicture,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
