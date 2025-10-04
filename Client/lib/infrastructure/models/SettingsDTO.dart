import 'package:hive/hive.dart';
import '../../domain/entities/Settings.dart'; // Импорт твоей доменной модели

part 'SettingsDTO.g.dart';

@HiveType(typeId: 0)
class SettingsDTO {
  @HiveField(0)
  bool isLightMode;

  @HiveField(1)
  double scaleForFontSize;

  @HiveField(2)
  String localeCode;

  SettingsDTO({
    required this.isLightMode,
    required this.scaleForFontSize,
    required this.localeCode,
  });

  // Конвертация из доменной модели в DTO
  factory SettingsDTO.fromDomain(Settings settings) {
    return SettingsDTO(
      isLightMode: settings.isLightMode,
      scaleForFontSize: settings.scaleForFontSize,
      localeCode: settings.localeCode,
    );
  }

  // Конвертация из DTO в доменную модель
  Settings toDomain() {
    return Settings(
      isLightMode: isLightMode,
      scaleForFontSize: scaleForFontSize,
      localeCode: localeCode,
    );
  }

  static var defaultSettings = SettingsDTO(
    isLightMode: true,
    scaleForFontSize: 1.0,
    localeCode: 'en',
  );
}
