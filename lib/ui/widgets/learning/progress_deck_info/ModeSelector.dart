import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';

class ModeSelector extends StatelessWidget {
  const ModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final theme = Theme.of(context);
    final s = S.of(context);
    return PopupMenuButton<String>(
      tooltip: S.of(context).selectStudyMode,
      color: colors.cardBackGroundColor,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'view',
          child: Text(s.view, style: theme.textTheme.bodyMedium),
        ),
        PopupMenuItem(
          value: 'learn_all',
          child: Text(s.learnAllCards, style: theme.textTheme.bodyMedium),
        ),
        PopupMenuItem(
          value: 'learn_new',
          child: Text(s.learnNewCards, style: theme.textTheme.bodyMedium),
        ),
        PopupMenuItem(
          value: 'learn_familiar',
          child: Text(s.learnFamiliarCards, style: theme.textTheme.bodyMedium),
        ),
      ],
      onSelected: (value) async {
        await Future.delayed(const Duration(milliseconds: 100));
        switch (value) {
          case 'view':
            context.read<LearningScreensCubit>().showFlashcardsViewerScreen();
            break;
          case 'learn_all':
            context.read<LearningScreensCubit>().showLearningAllScreen();
            break;
          case 'learn_new':
            context.read<LearningScreensCubit>().showLearningNewCountScreen();
            break;
          case 'learn_familiar':
            context.read<LearningScreensCubit>().showLearningFamiliarCountScreen();
            break;
        }
      },
      child: TextButton.icon(
        onPressed: null,
        icon: const Icon(Icons.menu_book_outlined),
        label: Text(s.mode,style: theme.textTheme.bodyMedium, ),
        style: TextButton.styleFrom(
          foregroundColor: colors.textColor,
        ),
      ),
    );
  }
}
