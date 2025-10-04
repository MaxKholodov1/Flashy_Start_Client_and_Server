import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/NavigationWidget.dart';
import '../../widgets/learning/main_screen_widgets/MainLearningScreenWidget.dart';

class MainLearningScreen extends StatelessWidget {
  const MainLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sstate = context.read<LearningScreensCubit>().state as MainLearningScreenState;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).study),
        actions: [
          IconButton(
            icon: const Icon(Icons.task_alt, size: 25,),
            tooltip: S.of(context).dailyTasks,
            onPressed: () {
              context.read<LearningScreensCubit>().showDailyTasksScreen(null);
              // открыть экран с заданиями
            },
          ),
          if (sstate.refreshButton == true)
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: S.of(context).refresh,
              onPressed: () {
                context.read<LearningScreensCubit>().showMainLearningScreen();
              },
            ),
        ],
      ),
      body: MainLearningScreenWidget(
        userProgressDecks: sstate.userLearningProgressDecks,
        onDispose: (offset) {
        context.read<LearningScreensCubit>().saveMainScreenOffset(offset);
      },),
      bottomNavigationBar: SafeArea(
        top: false, // не добавлять отступ сверху для NavigationWidget
        child: const NavigationWidget(),
      ),

    );
  }
}
