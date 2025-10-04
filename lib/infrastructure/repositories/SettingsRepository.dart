import 'package:hive/hive.dart';

import '../../domain/entities/Settings.dart';
import '../models/SettingsDTO.dart';

class SettingsRepository {
  final Box<SettingsDTO> box = Hive.box<SettingsDTO>('settings');

  Future<void> updateSettings({
    bool? isLightMode,
    double? scaleForFontSize,
    String? localeCode,
  }) async {
    final currentDTO = box.get('app') ?? SettingsDTO.fromDomain(Settings.defaultSettings);

    if (isLightMode != null) currentDTO.isLightMode = isLightMode;
    if (scaleForFontSize != null) currentDTO.scaleForFontSize = scaleForFontSize;
    if (localeCode != null) currentDTO.localeCode = localeCode;

    await box.put('app', currentDTO);
  }

  Future<Settings> getSettings() async {
    final dto = box.get('app');
    if (dto == null) return Settings.defaultSettings;
    return dto.toDomain();
  }

  Future<void> createInitialSettings(Settings settings) async {
    await box.put('app', SettingsDTO.fromDomain(settings));
  }
}
