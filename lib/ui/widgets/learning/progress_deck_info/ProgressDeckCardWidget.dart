import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningScreensCubit.dart';
import 'package:flashy_start/domain/entities/GlobalDeckInfo.dart';

import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';

class ProgressDeckCardWidget extends StatelessWidget {
  final GlobalDeckInfo globalDeckInfo;

  const ProgressDeckCardWidget({
    super.key,
    required this.globalDeckInfo,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity, // во всю ширину
      color: Colors.transparent,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              globalDeckInfo.globalDeck.isPublic ? S.of(context).publicDeck : S.of(context).privateDeck,
              style: theme.textTheme.bodySmall
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  globalDeckInfo.globalDeck.title,
                  style: theme.textTheme.headlineLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                if ((globalDeckInfo.globalDeck.description ?? "").isNotEmpty)
                  Text(
                    globalDeckInfo.globalDeck.description!,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${globalDeckInfo.authorName} • '
                      '${globalDeckInfo.globalDeck.createdAt != null ? _formatDate(globalDeckInfo.globalDeck.createdAt) : ""}',
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                child: Text(S.of(context).editors,
                style: theme.textTheme.bodySmall, ),
                onPressed: () {
                  context.read<LearningScreensCubit>().showViewEditorsScreen();
                }
              ),
            ],
          ),

        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';
  }
}
