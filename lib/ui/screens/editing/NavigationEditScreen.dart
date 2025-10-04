import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/screens/editing/CreatingCardScreen.dart';
import 'package:flashy_start/ui/screens/editing/EditingCardScreen.dart';
import 'package:flashy_start/ui/screens/editing/EditingDeckInfoScreen.dart';
import 'package:flashy_start/ui/screens/editing/EditingDeckSkeletonScreen.dart';
import 'package:flashy_start/ui/screens/editing/EditingOrCheckingEditorsScreen.dart';
import 'package:flashy_start/ui/screens/editing/MainEditingScreen.dart';
import 'package:flashy_start/ui/widgets/AuthorizationDialogWidget.dart';

import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/NavigationWidget.dart';
import 'CreatingDeckScreen.dart';
import 'EditingDeckScreen.dart';

class NavigationEditScreen extends StatelessWidget {
  const NavigationEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditScreensCubit, EditingScreenState>(
      builder: (context, state) {
        Widget body;
        if (state is MainEditingScreenState) {
          return MainEditingScreen();
        } else if (state is CreateDeckScreenState) {
          body =  CreatingDeckScreen();
        }else if (state is NeedAuthorizationScreenState){
          return AuthorizationDialogWidget();
        }else if (state is EditingDeckScreenState){
          return EditingDeckScreen();
        }else if (state is EditingDeckInfoScreenState){
            return EditingDeckInfoScreen();
        }else if ( state is CreatingCardScreenState){
          return CreatingCardScreen();
        }else if (state is EditingCardScreenState){
          return EditingCardScreen();
        }else if (state is EditingEditorsScreenState){
          return EditingOrCheckingEditorsScreen();
        }else if (state is EditingDeckSkeletonScreenState){
          return EditingDeckSkeletonScreen();
        }
        else {
          body = Center();
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
