import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/generated/FailureCodeLocalizer.dart';
import 'package:flashy_start/ui/widgets/settings/AccountInfoWidget.dart';
import 'package:flashy_start/ui/widgets/settings/MainSettingsErrorWidget.dart';
import 'package:flashy_start/ui/widgets/settings/MainSettingsWidget.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/SettingsScreenCubit.dart';
import '../../widgets/NavigationWidget.dart';
import 'AccountDeletedSuccessfullyScreen.dart';
import 'ChangePasswordScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsScreenCubit, SettingsScreenState>(
      builder: (context, state) {
        Widget body;
        if (state is MainSettingsScreen) {
          body = MainSettingsWidget();
        } else if (state is AccountScreen) {
          return AccountInfoWidget(user: state.user);
        }else if (state is MainSettingsScreenError){
          return MainSettingsErrorWidget(errorMessage: getFailureMessage(context, state.failureCode!), onRetry: state.onRetry, buttonMessage: state.buttonMessage);
        }else if (state is EditingPasswordScreenState){
          return EditingPasswordScreen();
        }else if (state is AccountDeletedSuccessfullyState){
          return AccountDeletedSuccessFullyScreen();
        }
        else {
          body = const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
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
