import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/domain/entities/GlobalDeck.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditScreenCubit.dart';

import '../../../themes/app_colors.dart';
import '../edit_deck/GradientGenerator.dart';

class EditableDeckWidget extends StatelessWidget {
  final searchResultDeck currentEditableGlobalDeck;
  final double currentOffset;

  const EditableDeckWidget({
    super.key,
    required this.currentEditableGlobalDeck,
    required this.currentOffset,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () {
        context.read<EditScreensCubit>().showGlobalDeckInfo(
          currentEditableGlobalDeck.ID,
          currentEditableGlobalDeck.title,
          currentEditableGlobalDeck.description,
          currentOffset,
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final baseColor = GradientGenerator.getTopColorFromId(currentEditableGlobalDeck.ID);

          return Container(
            width: double.infinity,
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: colors.cardBackGroundColor,
              border: Border.all(color: baseColor, width: 1),
              borderRadius: BorderRadius.circular(12), // например, 12 пикселей радиус
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    currentEditableGlobalDeck.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (currentEditableGlobalDeck.description != null &&
                    currentEditableGlobalDeck.description!.trim().isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      currentEditableGlobalDeck.description!,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
