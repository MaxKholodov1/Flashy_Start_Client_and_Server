import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/searching_screen_cubit/SearchingScreenCubit.dart';

import '../../../domain/entities/SearchGlobalDeck.dart';
import '../../../generated/l10n.dart';
import '../../themes/app_colors.dart';
import '../editing/edit_deck/GradientGenerator.dart';

class DeckWidget extends StatelessWidget {
  final SearchResultDeck searchResultDeck;
  final double currentOffset;
  final bool isAdded;
  final VoidCallback? onAddPressed;

  const DeckWidget({
    super.key,
    required this.searchResultDeck,
    required this.currentOffset,
    this.isAdded = false,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final baseColor = GradientGenerator.getTopColorFromId(
      searchResultDeck.globalDeck.ID,
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final showText = screenWidth > 600;

    return GestureDetector(
      onTap: () {
        context.read<SearchingScreensCubit>().showGlobalDeckInfo(
          searchResultDeck,
          currentOffset,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: colors.cardBackGroundColor,
          border: Border.all(color: baseColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Текстовая часть
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      searchResultDeck.globalDeck.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (searchResultDeck.globalDeck.description != null &&
                      searchResultDeck.globalDeck.description!.trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Text(
                        searchResultDeck.globalDeck.description!,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Кнопка добавления
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 140),
              child: isAdded
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check, size: 20, color: Colors.green),
                    if (showText) ...[
                      const SizedBox(width: 6),
                      Text(
                        S.of(context).added,
                        style: TextStyle(fontSize: 14, color: Colors.green),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              )
                  : IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
                onPressed: onAddPressed,
                icon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: showText ? 12 : 8,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: colors.textColor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add),
                      if (showText) ...[
                        const SizedBox(width: 6),
                        Text(
                          S.of(context).add,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
