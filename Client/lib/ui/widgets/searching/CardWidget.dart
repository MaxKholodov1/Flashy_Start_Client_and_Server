import 'package:flutter/material.dart';
import '../../../domain/entities/GlobalCard.dart';

class CardWidget extends StatelessWidget {
  final GlobalCard globalCard;
  final double Function() getCurrentOffset;

  const CardWidget({
    super.key,
    required this.globalCard,
    required this.getCurrentOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // максимальная ширина
      color: Colors.transparent, // прозрачный фон для распознавания касаний
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(globalCard.question),
            const SizedBox(height: 8),
            Text(globalCard.answer),
          ],
        ),
      ),
    );
  }
}
