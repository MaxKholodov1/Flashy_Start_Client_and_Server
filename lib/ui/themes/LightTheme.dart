part of 'Theme.dart';

ThemeData createLightTheme(Settings settings) {
  const surfaceLight = Color(0xFFF5F5F5);
  const surfaceContainer = Color.fromARGB(255, 235, 238, 243);
  const surfaceCard = Color.fromARGB(255, 235, 238, 243);
  const surfaceAccent = Color(0xFF1976D2);
  const surfaceButton = Color(0xFF2196F3);
  const surfaceInput = Color(0xFFF0F0F0);

  const highEmphasis = 0.87;
  const mediumEmphasis = 0.6;
  const disabled = 0.38;

  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      surface: surfaceLight,
      primary: surfaceAccent,
      surfaceVariant: surfaceInput,
      primaryContainer: surfaceButton,
      secondary: surfaceButton,
      secondaryContainer: surfaceContainer,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: createAppTextTheme(
      highEmphasisAlpha: (highEmphasis * 255).toInt(),
      mediumEmphasisAlpha: (mediumEmphasis * 255).toInt(),
      color: Colors.black,
      scale: settings.scaleForFontSize,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 178, 204, 255),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black.withAlpha((highEmphasis * 255).toInt()),
      ),
      iconTheme: IconThemeData(
        color: Colors.black.withAlpha((highEmphasis * 255).toInt()),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: surfaceButton,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardTheme: const CardTheme(
      color: surfaceCard,
      elevation: 2,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceInput,
      labelStyle: TextStyle(
        color: Colors.black.withAlpha((mediumEmphasis * 255).toInt()),
      ),
      hintStyle: TextStyle(
        color: Colors.black.withAlpha((mediumEmphasis * 255).toInt()),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.black.withAlpha((0.12 * 255).toInt()),
      thickness: 1,
      space: 1,
    ),
    scaffoldBackgroundColor: surfaceLight,
    cardColor: surfaceCard,
    hintColor: Colors.black.withAlpha((mediumEmphasis * 255).toInt()),
    disabledColor: Colors.black.withAlpha((disabled * 255).toInt()),
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        deckBackground: Color(0xFFFFFFFF),
        tagBackground: Color(0xFFE0E0E0),
        tagTextColor: Colors.blue,
        backGround: Colors.white,
        surfaceBackground: Color.fromARGB(255, 247, 247, 247),
        dividerOnSurfaceBackground: Color.fromARGB(255, 187, 187, 187),
        cardBackGroundColor:  Color.fromARGB(255, 235, 238, 243),
        appBarColor: Color.fromARGB(255, 178, 204, 255),
        textColor: Colors.black,
        greenOnSurfaceBackground: Color(0xFF4CAF50),
        redOnSurfaceBackground: Colors.red,
        blueOnSurfaceBackground: Color(0xFF4D96FF),
        orangeOnSurfaceBackground: Color(0xFFFFA726),
  ),
    ],
  );
}
