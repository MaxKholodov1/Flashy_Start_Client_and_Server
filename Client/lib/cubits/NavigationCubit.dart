import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MainScreenState {}

class EditingScreenState extends MainScreenState {}
class LearningScreenState extends MainScreenState {}
class SettingsScreenState extends MainScreenState {}
class SearchingScreenState extends MainScreenState{}

class NavigationCubit extends Cubit<MainScreenState> {
  NavigationCubit(super.startScreen);

  void showEditScreen()  =>  emit(EditingScreenState());
  void showLearningScreen() => emit(LearningScreenState());
  void showSettingsScreen() => emit(SettingsScreenState());
  void showSearchingScreen() => emit(SearchingScreenState());
}