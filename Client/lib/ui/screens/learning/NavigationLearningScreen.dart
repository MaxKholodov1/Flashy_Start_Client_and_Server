import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/screens/learning/DailyTasksScreen.dart';
import 'package:flashy_start/ui/screens/learning/FlashcardsViewerScreen.dart';
import 'package:flashy_start/ui/screens/learning/LearningCardsScreen.dart';
import 'package:flashy_start/ui/screens/learning/RevewingCardsScreen.dart';
import 'package:flashy_start/ui/screens/learning/ViewEditorsScreen.dart';
import 'package:flashy_start/ui/widgets/learning/learning_cards/ChooseTheNumberOfLearningCards.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/AuthorizationDialogWidget.dart';
import '../../widgets/NavigationWidget.dart';
import 'LearningDeckInfoScreen.dart';
import 'MainLearningScreen.dart';

class NavigationLearningScreen extends StatelessWidget {
  const NavigationLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<LearningScreensCubit, LearningScreenState>(
      builder: (context, state) {
        Widget body;
        if (state is MainLearningScreenState) {
          return MainLearningScreen();
        } else if (state is NeedAuthorizationScreenState){
          return AuthorizationDialogWidget();
        }else if (state is LearningDeckInfoScreenState){
          return LearningDeckInfoScreen();
        }else if (state is FlashcardsViewerScreenState){
          return FlashcardsViewerScreen(cards: state.progressCards!);
        }else if (state is LearningCardsScreenState){
          return LearningCardsScreen();
        }else if (state is SelectCountState){
          return ChooseNumberOfLearningCardsWidget(numberOfCards: state.progressCards.length);
        }else if (state is DailyTasksScreenState){
          return DailyTasksScreen();
        }else if (state is ReviewingCardsScreenState){
          return ReviewingCardsScreen();
        }else if (state is ViewEditorsScreenState){
          return ViewEditorsScreen();
        }
        else {
          body = const Center();
        }
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).editTheDecks),),
          body: SafeArea(child: body),
          bottomNavigationBar: SafeArea(
            top: false, // не добавлять отступ сверху для NavigationWidget
            child: const NavigationWidget(),
          ),
        );
      },
    );
  }
}
