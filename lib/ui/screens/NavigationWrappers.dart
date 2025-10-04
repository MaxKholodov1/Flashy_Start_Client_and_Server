import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningStates.dart';
import 'package:flashy_start/ui/screens/searching/NavidationSearchingScreen.dart';

import '../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import 'editing/NavigationEditScreen.dart';
import 'learning/NavigationLearningScreen.dart';

class NavigationEditScreenWrapper extends StatefulWidget {
  const NavigationEditScreenWrapper({Key? key}) : super(key: key);

  @override
  State<NavigationEditScreenWrapper> createState() => _NavigationEditScreenWrapperState();
}

class _NavigationEditScreenWrapperState extends State<NavigationEditScreenWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // вызываем init() при каждом появлении экрана
    final cubit = context.read<EditScreensCubit>();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return const NavigationEditScreen();
  }
}



class NavigationSearchingScreenWrapper extends StatefulWidget {
  const NavigationSearchingScreenWrapper({Key? key}) : super(key: key);

  @override
  State<NavigationSearchingScreenWrapper> createState() => _NavigationSearchingScreenWrapperState();
}

class _NavigationSearchingScreenWrapperState extends State<NavigationSearchingScreenWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = context.read<SearchingScreensCubit>();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return const NavigationSearchingScreen();
  }
}
class NavigationLearningScreenWrapper extends StatefulWidget {
  const NavigationLearningScreenWrapper({Key? key}) : super(key: key);

  @override
  State<NavigationLearningScreenWrapper> createState() => _NavigationLearningScreenWrapperState();
}

class _NavigationLearningScreenWrapperState extends State<NavigationLearningScreenWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = context.read<LearningScreensCubit>();
    if (cubit.state is MainLearningScreenState) {
      cubit.showMainLearningScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const NavigationLearningScreen();
  }
}