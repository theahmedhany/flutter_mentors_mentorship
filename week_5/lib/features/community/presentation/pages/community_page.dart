import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/community_cubit.dart';
import '../cubit/community_state.dart';
import '../widgets/forum_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Community'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Learn Stock,',
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Educate the World',
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Search Bar
              BlocBuilder<CommunityCubit, CommunityState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        context.read<CommunityCubit>().searchPosts(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search something...',
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.textHint,
                        ),
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Forum Posts
              BlocBuilder<CommunityCubit, CommunityState>(
                builder: (context, state) {
                  if (state is CommunityLoaded) {
                    return Column(
                      children: state.filteredPosts.map((post) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ForumCard(post: post),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
