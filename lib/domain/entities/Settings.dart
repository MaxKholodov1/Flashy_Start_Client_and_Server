import 'dart:ui';

class Settings {
  final bool isLightMode;
  final double scaleForFontSize;
  final String localeCode;
  const Settings({
    required this.isLightMode,
    required this.scaleForFontSize,
    required this.localeCode,
  });
  Settings copyWith({
    bool? isLightMode,
    double? scaleForFontSize,
    String? localeCode,}) {
    return Settings(
      isLightMode: isLightMode ?? this.isLightMode,
      scaleForFontSize: scaleForFontSize ?? this.scaleForFontSize,
      localeCode: localeCode ?? this.localeCode,);
  }
  static Settings get defaultSettings {
    return Settings(
      isLightMode: true,
      scaleForFontSize: 1.0,
      localeCode: 'en',
    );
  }
  Locale get locale =>
      localeCode.isEmpty
          ? const Locale('en')
          : Locale(localeCode);}