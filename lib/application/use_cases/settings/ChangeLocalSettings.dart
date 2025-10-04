import '../../../domain/entities/Settings.dart';
import '../../../infrastructure/repositories/SettingsRepository.dart';

class ChangeLocalSettings {
  final SettingsRepository settingsRepository;

  ChangeLocalSettings(this.settingsRepository);

  Future<void> changeThemeMode(bool isLightMode) async {
    await settingsRepository.updateSettings(isLightMode: isLightMode);
  }
  Future<void> changeScaleForFontSize(double scale) async {
    await settingsRepository.updateSettings(scaleForFontSize: scale);
  }
  Future<void> changeLocaleCode(String localeCode) async {
    await settingsRepository.updateSettings(localeCode: localeCode);
  }
  Future<void> restoreDefaults() async{
    Settings s= Settings.defaultSettings;
    await settingsRepository.updateSettings(localeCode: s.localeCode,
      isLightMode: s.isLightMode,
      scaleForFontSize: s.scaleForFontSize,
    );
  }
}