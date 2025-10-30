import 'package:flutter/material.dart';
import 'package:week_6/core/helpers/spacing.dart';
import 'package:week_6/features/details/presentation/widgets/movie_info_card.dart';

class MovieInfoGrid extends StatelessWidget {
  const MovieInfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.access_time_rounded,
                label: 'Duration',
                value: '2h 28m',
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.calendar_today_rounded,
                label: 'Release',
                value: '2024',
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.language_rounded,
                label: 'Language',
                value: 'English',
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.supervisor_account_rounded,
                label: 'Director',
                value: 'John Doe',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
