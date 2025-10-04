import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/use_cases/settings/ChangeLocalSettings.dart';
import '../domain/entities/Settings.dart';

class DisplayCubit extends Cubit<Settings> {
  final ChangeLocalSettings changeLocalSettings;
  DisplayCubit({required this.changeLocalSettings, required Settings initialSettings}) : super(initialSettings);


  Future<void> toggleTheme(bool isLight) async {
    await changeLocalSettings.changeThemeMode(isLight);
    emit(state.copyWith(isLightMode: isLight));
  }
  Future<void> changeScaleForFontSize(double scale) async {
    await changeLocalSettings.changeScaleForFontSize(scale);
    emit(state.copyWith(scaleForFontSize: scale));
  }
  Future<void> changeLocaleCode(String localeCode) async {
    await changeLocalSettings.changeLocaleCode(localeCode);
    emit(state.copyWith(localeCode: localeCode));
  }
  void emitSettings( Settings settings){
    emit(settings);
  }
  Future<void> resetDefaults() async {
    await changeLocalSettings.restoreDefaults();
    emit(Settings.defaultSettings);
  }
}
