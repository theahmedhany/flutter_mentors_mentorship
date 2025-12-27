import 'package:equatable/equatable.dart';

import '../../data/models/forum_post.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object?> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoaded extends CommunityState {
  final List<ForumPost> posts;
  final List<ForumPost> filteredPosts;

  const CommunityLoaded({required this.posts, required this.filteredPosts});

  @override
  List<Object?> get props => [posts, filteredPosts];
}
