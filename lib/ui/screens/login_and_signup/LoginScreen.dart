import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/ui/widgets/startup_and_log_in/LoginWidget.dart';
import '../../../cubits/login_and_signup/LoginCubit.dart';
import '../../widgets/startup_and_log_in/LoginSuccessWidget.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        if (state is LoginSuccess) {
          Future.delayed(const Duration(seconds: 1), () {
            context.read<StartupCubit>().showFinishScreen(state.userID);
          });
        }
        if (state is EmailVerificationState){
          context.read<StartupCubit>().showEmailVerificationScreen(state.userID);
        }
      },
      builder: (context, state) {

        if (state is LoginSuccess) {
          return const LoginSuccessWidget();
        }
        if (state is EmailVerificationState){
          context.read<StartupCubit>().showEmailVerificationScreen(state.userID);
        }
        return const LoginWidget();
      },
    );
  }
}

