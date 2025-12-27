import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/forum_post.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial()) {
    _loadForumPosts();
  }

  void _loadForumPosts() {
    final posts = [
      ForumPost(
        title: 'How to Start Investing in uStock',
        description:
            'Lemme tell you this, world of investing is really really legit, especially using uStock. Why? Becaus...',
        userAvatars: const ['👤', '👤', '👤'],
        additionalMembers: 49,
      ),
      ForumPost(
        title: 'How to Predict the Candlestick',
        description:
            "What is candlestick? It's like candle but not actually sweet candle. It's some benchmark to w...",
        userAvatars: const ['👤', '👤', '👤'],
        additionalMembers: 49,
      ),
      ForumPost(
        title: 'Is Trading Safe for Newbie Investor?',
        description:
            "Many people ask us about trading in uStock, is trading safe for you if you're newbie player in uSt...",
        userAvatars: const ['👤', '👤', '👤'],
        additionalMembers: 49,
      ),
    ];

    emit(CommunityLoaded(posts: posts, filteredPosts: posts));
  }

  void searchPosts(String query) {
    if (state is CommunityLoaded) {
      final currentState = state as CommunityLoaded;
      if (query.isEmpty) {
        emit(
          CommunityLoaded(
            posts: currentState.posts,
            filteredPosts: currentState.posts,
          ),
        );
      } else {
        final filtered = currentState.posts
            .where(
              (post) =>
                  post.title.toLowerCase().contains(query.toLowerCase()) ||
                  post.description.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        emit(
          CommunityLoaded(posts: currentState.posts, filteredPosts: filtered),
        );
      }
    }
  }
}
