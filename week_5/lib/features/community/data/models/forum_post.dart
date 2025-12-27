import 'package:equatable/equatable.dart';

class ForumPost extends Equatable {
  final String title;
  final String description;
  final List<String> userAvatars;
  final int additionalMembers;

  const ForumPost({
    required this.title,
    required this.description,
    required this.userAvatars,
    this.additionalMembers = 0,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    userAvatars,
    additionalMembers,
  ];
}
