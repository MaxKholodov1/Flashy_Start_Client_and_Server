import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';

import '../../../themes/app_colors.dart';
import '../../editing/edit_deck/GradientGenerator.dart';

class UserProgressDeckWidget extends StatelessWidget {
  final UserDeckProgress currentUserDeckProgress;
  final double Function() getCurrentOffset;

  const UserProgressDeckWidget({
    super.key,
    required this.currentUserDeckProgress,
    required this.getCurrentOffset,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final baseColor = GradientGenerator.getTopColorFromId(
      currentUserDeckProgress.deckID,
    );
    final description = currentUserDeckProgress.description;
    final lastReviewedAt = currentUserDeckProgress.lastReviewedAt;

    final shouldShowDescription =
        description.trim().isNotEmpty;
    final shouldShowLastReviewed =
        lastReviewedAt != null && lastReviewedAt.millisecondsSinceEpoch != 0;

    return GestureDetector(
      onTap: () {
        context
            .read<LearningScreensCubit>()
            .showLearningDeckInfo(currentUserDeckProgress.deckID, getCurrentOffset(),);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: colors.cardBackGroundColor,
          border: Border.all(
            color: baseColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                currentUserDeckProgress.title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Description
            if (shouldShowDescription) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            const SizedBox(height: 8),
            // Last reviewed
            if (shouldShowLastReviewed)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 2),
                child: Text(
                  "${S.of(context).lastReviewedAt}: ${lastReviewedAt.toLocal()}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
