import 'package:flutter/material.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';

import '../../../themes/app_colors.dart';

class StatusBar extends StatelessWidget {
  final double width;
  final List<UserProgressCard> cards;

  StatusBar({
    super.key,
    required this.width,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final Map<int, Color> colorMap = {
      0: const Color.fromARGB(255, 150, 150, 150),
      1: colors.redOnSurfaceBackground,
      2: colors.orangeOnSurfaceBackground,
      3: colors.greenOnSurfaceBackground,
      4: colors.blueOnSurfaceBackground,
    };

    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200], // Фон для незаполненных областей
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: BuildColorStrip(colorMap),
      ),
    );
  }

  Widget BuildColorStrip(Map<int, Color> colorMap) {
    final memories = cards.map((f) => f.shortTermMemory.index).toList();
    final totalItems = memories.length;

    return Row(
      children: List.generate(totalItems, (index) {
        final memory = memories[index];
        return Expanded(
          child: Container(
            color: colorMap[memory] ?? Colors.grey,
          ),
        );
      }),
    );
  }
}
