part of 'Theme.dart';

ThemeData createDarkTheme(Settings settings) {
  const surfaceDark = Color.fromARGB(255, 18, 18, 18);
  const surfaceContainer = Color.fromARGB(255, 33, 33, 33);
  const surfaceCard = Color(0xFFCCCCCC);
  const surfaceAccent = Color(0xFFCB2D6F);
  const surfaceButton = Color.fromARGB(255, 33, 33, 33);
  const surfaceInput = Color(0xFF1F1F1F);

  const highEmphasis = 0.95;
  const mediumEmphasis = 0.7;
  const disabled = 0.5;

  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      surface: surfaceDark,
      primary: surfaceAccent,
      surfaceVariant: surfaceInput,
      primaryContainer: surfaceButton,
      secondary: surfaceButton,
      secondaryContainer: surfaceContainer,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: createAppTextTheme(
      highEmphasisAlpha: (highEmphasis * 255).toInt(),
      mediumEmphasisAlpha: (mediumEmphasis * 255).toInt(),
      color: Colors.white,
      scale: settings.scaleForFontSize,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white.withAlpha((highEmphasis * 255).toInt()),
      ),
      iconTheme: IconThemeData(
        color: Colors.white.withAlpha((highEmphasis * 255).toInt()),
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
        color: Colors.white.withAlpha((mediumEmphasis * 255).toInt()),
      ),
      hintStyle: TextStyle(
        color: Colors.white.withAlpha((mediumEmphasis * 255).toInt()),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white.withAlpha((0.12 * 255).toInt()),
      thickness: 1,
      space: 1,
    ),
    scaffoldBackgroundColor: surfaceDark,
    cardColor: surfaceCard,
    hintColor: Colors.white.withAlpha((mediumEmphasis * 255).toInt()),
    disabledColor: Colors.white.withAlpha((disabled * 255).toInt()),
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        deckBackground: Color(0xFF104D09),
        tagBackground: Color(0xFF333333),
        tagTextColor: Colors.lightBlueAccent,
        backGround: Colors.black,
        surfaceBackground: Color.fromARGB(255, 18, 18, 18),
        dividerOnSurfaceBackground: Colors.white24,
        cardBackGroundColor: Color.fromARGB(255, 33, 33, 33),
        appBarColor: Colors.black,
        textColor: Colors.white,
        greenOnSurfaceBackground: Color(0xFF4CAF50),
        redOnSurfaceBackground: Colors.red,
        blueOnSurfaceBackground: Color(0xFF4D96FF),
        orangeOnSurfaceBackground: Color(0xFFFFA726),
      ),
    ],
  );
}
