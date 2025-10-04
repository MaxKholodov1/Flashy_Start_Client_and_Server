import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/DisplayCubit.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/ui/screens/login_and_signup/RegistrationScreen.dart';
import 'package:flashy_start/ui/widgets/SplashWidget.dart';
import 'package:flashy_start/ui/widgets/startup_and_log_in/EmailVerificationScreenWidget.dart';
import 'package:flashy_start/ui/widgets/startup_and_log_in/StartupConnectingWidget.dart';
import '../../domain/entities/Settings.dart';
import 'MainScreen.dart';
import 'settings/PasswordRecoveryScreen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartupCubit, StartupState>(
      listener: (context, startupState) {
        if (startupState is GetSettingsForDisplayCubit){
          Settings? settings = startupState.settings;
          if (settings == null){
            context.read<DisplayCubit>().resetDefaults();
            context.read<DisplayCubit>().emitSettings(Settings.defaultSettings);
          }else{
            context.read<DisplayCubit>().emitSettings(settings);
          }
        }
        },
      builder: (context, startupState) {
        if (startupState is StartupLoading) {
          return const Scaffold(
            body: SplashWidget(),
          );
        } else if (startupState is StartupNeedsLogIn) {
          return const Scaffold(
            body: RegistrationScreen(),
          );
        } else if (startupState is StartupReady) {
          return  MainScreenWrapper();
        } else if (startupState is StartupConnecting) {
          return StartupConnectingWidget();
        }else if (startupState is EmailVerification){
          return EmailVerificationScreenWidget();
        }else if (startupState is PasswordRecoveryState){
          return PasswordRecoveryScreen();
        }
        return  MainScreenWrapper();
      },
    );
  }
}
