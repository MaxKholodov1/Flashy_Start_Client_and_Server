import 'package:flutter/material.dart';
import 'package:flashy_start/domain/entities/ShortTermMemoryEnum.dart';
import '../../../../domain/entities/UserCardProgress.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';

class ProgressCardWidget extends StatelessWidget {
  final UserProgressCard userProgressCard;
  final double Function() getCurrentOffset;

  const ProgressCardWidget({
    super.key,
    required this.userProgressCard,
    required this.getCurrentOffset,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    final nextReviewDate = userProgressCard.nextReviewDate;
    final scheduledDate = nextReviewDate != null
        ? "${nextReviewDate.day.toString().padLeft(2, '0')}.${nextReviewDate.month.toString().padLeft(2, '0')}.${nextReviewDate.year}"
        : null;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: colors.cardBackGroundColor,
            border: Border.all(color: getBorderColor(userProgressCard, colors), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  userProgressCard.question,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Divider(color: colors.dividerOnSurfaceBackground),
              const SizedBox(height: 8),
              Text(
                userProgressCard.answer,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (scheduledDate != null || userProgressCard.lastReviewedAt != null) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 20, // расстояние между элементами по горизонтали
                  runSpacing: 4, // расстояние между строками, если переносится
                  children: [
                    if (userProgressCard.lastReviewedAt != null)
                      Text(
                        "${S.of(context).lastReviewedAt}: "
                            "${userProgressCard.lastReviewedAt!.day.toString().padLeft(2, '0')}."
                            "${userProgressCard.lastReviewedAt!.month.toString().padLeft(2, '0')}."
                            "${userProgressCard.lastReviewedAt!.year}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    if (scheduledDate != null)
                      Text(
                        "${S.of(context).scheduledReviewDate}: $scheduledDate",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}

Color getBorderColor(UserProgressCard card, AppColors colors) {
  if (card.shortTermMemory == ShortTermMemory.bad){
    return colors.redOnSurfaceBackground;
  }else if (card.shortTermMemory == ShortTermMemory.normal){
    return colors.orangeOnSurfaceBackground;
  }else if (card.shortTermMemory == ShortTermMemory.good){
    return colors.greenOnSurfaceBackground;
  }else if (card.shortTermMemory == ShortTermMemory.perfect){
    return colors.blueOnSurfaceBackground;
  }else{
    return Colors.blueGrey;
  }
}