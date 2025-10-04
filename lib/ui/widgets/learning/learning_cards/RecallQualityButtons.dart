import 'package:flutter/material.dart';
import 'package:flashy_start/domain/entities/RecallQualityEnum.dart';
import '../../../themes/app_colors.dart';

class RecallQualityButtons extends StatelessWidget {
  final bool isLoading;
  final void Function(RecallQuality quality) onLeftSwipe;
  final void Function(RecallQuality quality) onRightSwipe;
  final double cardWidth;
  final bool isDesktop;

  const RecallQualityButtons({
    super.key,
    required this.isLoading,
    required this.onLeftSwipe,
    required this.onRightSwipe,
    required this.cardWidth,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Center(
      child: SizedBox(
        width: cardWidth,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(
              icon: Icons.sentiment_dissatisfied_rounded,
              color: colors.redOnSurfaceBackground,
              onPressed: () => onLeftSwipe(RecallQuality.bad),
              colors: colors,
              buttonHeight: getButtonHeight()             ),
            _buildButton(
              icon: Icons.sentiment_neutral,
              color: colors.orangeOnSurfaceBackground,
              onPressed: () => onLeftSwipe(RecallQuality.normal),
              colors: colors,
              buttonHeight: getButtonHeight()
            ),
            _buildButton(
              icon: Icons.sentiment_satisfied_sharp,
              color: colors.greenOnSurfaceBackground,
              onPressed: () => onRightSwipe(RecallQuality.good),
              colors: colors,
              buttonHeight: getButtonHeight()
            ),
            _buildButton(
              icon: Icons.sentiment_very_satisfied_rounded ,
              color: colors.blueOnSurfaceBackground,
              onPressed: () => onRightSwipe(RecallQuality.perfect),
              colors: colors,
              buttonHeight: getButtonHeight()
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required AppColors colors,
    required double buttonHeight,
  }) {
    return SizedBox(
      width: getButtonWidth(),
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, buttonHeight), // ширина под SizedBox, высота 56
          backgroundColor: colors.cardBackGroundColor, // лёгкий фон
          side: BorderSide(color: color, width: 2), // рамка
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          foregroundColor: color, // цвет ripple эффекта и иконки по умолчанию
        ),
        child: Icon(
          icon,
          color: color, // цвет иконки
          size: 29,
        ),
      ),
    );
  }

  double getButtonWidth() {
    return isDesktop ? cardWidth / 4.5 : cardWidth / 4 - 8;
  }
  double getButtonHeight(){
    return isDesktop ? 80 : getButtonWidth();
  }
}
