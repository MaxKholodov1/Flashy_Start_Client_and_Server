import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color deckBackground;
  final Color tagBackground;
  final Color tagTextColor;
  final Color backGround;
  final Color surfaceBackground;
  final Color dividerOnSurfaceBackground;
  final Color cardBackGroundColor;
  final Color appBarColor;
  final Color textColor;
  final Color greenOnSurfaceBackground;
  final Color redOnSurfaceBackground;
  final Color blueOnSurfaceBackground;
  final Color orangeOnSurfaceBackground;

  const AppColors({
    required this.deckBackground,
    required this.tagBackground,
    required this.tagTextColor,
    required this.backGround,
    required this.surfaceBackground,
    required this.dividerOnSurfaceBackground,
    required this.cardBackGroundColor,
    required this.appBarColor,
    required this.textColor,
    required this.greenOnSurfaceBackground,
    required this.redOnSurfaceBackground,
    required this.blueOnSurfaceBackground,
    required this.orangeOnSurfaceBackground,
  });

  @override
  AppColors copyWith({
    Color? deckBackground,
    Color? tagBackground,
    Color? tagTextColor,
    Color? backGround,
    Color? surfaceBackground,
    Color? dividerOnSurfaceBackground,
    Color? cardBackGroundColor,
    Color? appBarColor,
    Color? textColor,
    Color? greenOnSurfaceBackground,
    Color? redOnSurfaceBackground,
    Color? blueOnSurfaceBackground,
    Color? orangeOnSurfaceBackground,
  }) {
    return AppColors(
      deckBackground: deckBackground ?? this.deckBackground,
      tagBackground: tagBackground ?? this.tagBackground,
      tagTextColor: tagTextColor ?? this.tagTextColor,
      backGround: backGround ?? this.backGround,
      surfaceBackground: surfaceBackground ?? this.surfaceBackground,
      dividerOnSurfaceBackground:
      dividerOnSurfaceBackground ?? this.dividerOnSurfaceBackground,
      cardBackGroundColor: cardBackGroundColor ?? this.cardBackGroundColor,
      appBarColor: appBarColor ?? this.appBarColor,
      textColor: textColor ?? this.textColor,
      greenOnSurfaceBackground:
      greenOnSurfaceBackground ?? this.greenOnSurfaceBackground,
      redOnSurfaceBackground:
      redOnSurfaceBackground ?? this.redOnSurfaceBackground,
      blueOnSurfaceBackground:
      blueOnSurfaceBackground ?? this.blueOnSurfaceBackground,
      orangeOnSurfaceBackground:
      orangeOnSurfaceBackground ?? this.orangeOnSurfaceBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      deckBackground: Color.lerp(deckBackground, other.deckBackground, t)!,
      tagBackground: Color.lerp(tagBackground, other.tagBackground, t)!,
      tagTextColor: Color.lerp(tagTextColor, other.tagTextColor, t)!,
      backGround: Color.lerp(backGround, other.backGround, t)!,
      surfaceBackground:
      Color.lerp(surfaceBackground, other.surfaceBackground, t)!,
      dividerOnSurfaceBackground: Color.lerp(
          dividerOnSurfaceBackground, other.dividerOnSurfaceBackground, t)!,
      cardBackGroundColor:
      Color.lerp(cardBackGroundColor, other.cardBackGroundColor, t)!,
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      greenOnSurfaceBackground:
      Color.lerp(greenOnSurfaceBackground, other.greenOnSurfaceBackground, t)!,
      redOnSurfaceBackground:
      Color.lerp(redOnSurfaceBackground, other.redOnSurfaceBackground, t)!,
      blueOnSurfaceBackground:
      Color.lerp(blueOnSurfaceBackground, other.blueOnSurfaceBackground, t)!,
      orangeOnSurfaceBackground:
      Color.lerp(orangeOnSurfaceBackground, other.orangeOnSurfaceBackground, t)!,
    );
  }
}
