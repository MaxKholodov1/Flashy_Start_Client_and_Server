import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import '../../../application/use_cases/user/CreateUser.dart';
import '../../../application/use_cases/user/Login.dart';
import '../../../cubits/login_and_signup/LoginCubit.dart';
import '../../widgets/startup_and_log_in/RegistrationFormWidget.dart';

import '../../../../application/use_cases/user/CheckUserNameAvailability.dart';
import '../../../../application/use_cases/user/CheckUserEmailAvailability.dart';
import '../../../../application/use_cases/user/CheckUserPasswordAvailability.dart';
import '../../../cubits/login_and_signup/RegistrationCubit.dart';
import 'LoginScreen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupCubit, StartupState>(
      builder: (context, state) {
        if (state is Authorization) {
          return BlocProvider(
            create: (_) => LoginCubit(
              loginUseCase: context.read<Login>(),
            ),
            child: const LoginScreen(),
          );
        } else if (state is Registration) {
          // Создаем Cubit прямо здесь
          return BlocProvider(
            create: (_) => RegistrationCubit(
              checkUserNameAvailability:
                context.read<CheckUserNameAvailability>(),
              checkUserEmailAvailability: context.read<CheckUserEmailAvailability>(),
              checkUserPasswordAvailability:  context.read<CheckUserPasswordAvailability>(),
              createUser: context.read<CreateUser>()
            ),
            child: const RegistrationFormWidget(),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
