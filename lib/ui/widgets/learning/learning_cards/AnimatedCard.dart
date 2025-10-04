import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';


class WaterOverlayCard extends StatelessWidget {
  final String question;
  final String answer;
  final double cardWidth;
  final double cardHeight;

  const WaterOverlayCard({
    super.key,
    required this.question,
    required this.answer,
    required this.cardHeight,
    required this.cardWidth
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;


    final GlobalKey<FlipCardState> cardKey = GlobalKey();

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Задняя полупрозрачная карточка
          Opacity(
            opacity: 1,
            child: _buildCard(cardWidth *0.94, cardHeight *0.94 , "", colors),
          ),
          // Основная анимированная FlipCard
          FlipCard(
            key: cardKey, // Добавляем ключ для управления состоянием
            direction: FlipDirection.HORIZONTAL,
            speed: 400,
            front: _buildCard(cardWidth, cardHeight, question, colors),
            back: _buildCard(cardWidth, cardHeight, answer, colors),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      double width, double height, String text, AppColors colors) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors.cardBackGroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: colors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}