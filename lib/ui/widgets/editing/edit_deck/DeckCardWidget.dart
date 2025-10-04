import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditScreenCubit.dart';
import 'package:flashy_start/domain/entities/GlobalDeckInfo.dart';

import '../../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';

class DeckCardWidget extends StatelessWidget {
  final GlobalDeckInfo globalDeckInfo;

  const DeckCardWidget({
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
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                var sstate = context.read<EditScreensCubit>().state as EditingDeckScreenState;
                context.read<EditScreensCubit>().showEditingDeckInfoScreen(
                    globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards
                );
              },
              child: AnimatedContainer(
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
                onPressed: () {
                  context.read<EditScreensCubit>().showEditingEditorsScreen();
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all(const Size(50, 30)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  overlayColor: WidgetStateProperty.all(Colors.transparent), // чтобы не было фона при наведении
                  foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.hovered)) {
                      return colors.textColor.withValues(alpha: 0.6);

                    }
                    return colors.textColor;

                  }),
                ),
                child: Text(
                  S.of(context).editors,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),            ],
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
