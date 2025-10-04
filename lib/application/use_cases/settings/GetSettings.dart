
import '../../../domain/entities/Settings.dart';
import '../../../infrastructure/repositories/SettingsRepository.dart';

class GetSettings {
  final SettingsRepository settingsRepository;
  GetSettings(this.settingsRepository);
  Future<Settings?> execute() async {
    return await settingsRepository.getSettings();
  }
}