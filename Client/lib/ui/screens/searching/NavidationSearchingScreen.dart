import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/screens/searching/DeckInfoScreen.dart';
import 'package:flashy_start/ui/screens/searching/ViewEditorsScreen.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/AuthorizationDialogWidget.dart';
import '../../widgets/NavigationWidget.dart';
import 'MainSearchingScreen.dart';

class NavigationSearchingScreen extends StatelessWidget {
  const NavigationSearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<SearchingScreensCubit, SearchingScreenState>(
        builder: (context, state) {
          Widget body;
          if (state is MainSearchingScreenState) {
            return MainSearchingScreen();
          } else if (state is NeedAuthorizationScreenState){
            return AuthorizationDialogWidget();
          }else if (state is DeckInfoScreenState){
            return DeckInfoScreen();
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
