import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/widgets/learning/daily_tasks/DailyTasksScreenWidget.dart';

import '../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/NavigationWidget.dart';

class DailyTasksScreen extends StatelessWidget {
  const DailyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sstate = context.read<LearningScreensCubit>().state as DailyTasksScreenState;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).dailyTasks),
        leading: BackButton(onPressed: context.read<LearningScreensCubit>().showMainLearningScreen,),
        actions: [
          if (sstate.refreshButton == true)
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: S.of(context).refresh,
              onPressed: () {
                context.read<LearningScreensCubit>().showDailyTasksScreen(null);
              },
            ),
        ],
      ),
      body: DailyTasksScreenWidget(userProgressDecks: sstate.todayRevisionDecks,),
      bottomNavigationBar: SafeArea(
        top: false, // не добавлять отступ сверху для NavigationWidget
        child: const NavigationWidget(),
      ),

    );
  }
}
