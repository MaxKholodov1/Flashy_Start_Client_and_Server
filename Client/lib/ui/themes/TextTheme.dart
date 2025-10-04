part of 'Theme.dart';
TextTheme createAppTextTheme({
  required int highEmphasisAlpha,
  required int mediumEmphasisAlpha,
  required Color color,
  double scale = 1.0,
}) {
  double s(double base) => base * scale;

  return TextTheme(
    displayLarge: TextStyle(
      fontSize: s(32),
      fontWeight: FontWeight.bold,
      color: color,
    ),
    displayMedium: TextStyle(
      fontSize: s(28),
      fontWeight: FontWeight.bold,
      color: color,
    ),
    titleLarge: TextStyle(
      fontSize: s(26),
      fontWeight: FontWeight.bold,
      color: color,
    ),
    titleMedium: TextStyle(
      fontSize: s(18),
      fontWeight: FontWeight.w600,
      color: color,
    ),
    titleSmall: TextStyle(
      fontSize: s(16),
      fontWeight: FontWeight.w500,
      color: color,
    ),
    bodyLarge: TextStyle(
      fontSize: s(18),
      color: color,
    ),
    bodyMedium: TextStyle(
      fontSize: s(16),
      color: color,
    ),
    bodySmall: TextStyle(
      fontSize: s(12),
      color: color,
    ),
    labelLarge: TextStyle(
      fontSize: s(18),
      fontWeight: FontWeight.w500,
      color: color,
    ),
    labelMedium: TextStyle(
    fontSize: s(14),
    fontWeight: FontWeight.w500,
    color: color,
  ),
    labelSmall: TextStyle(
      fontSize: s(14),
      fontWeight: FontWeight.w500,
      color: color,
    ),
    headlineLarge: TextStyle(
      fontSize: s(30),
      color: color,
    ),
      headlineMedium: TextStyle(
        fontSize: s(22),
        color: color,
      ),
  );
}
