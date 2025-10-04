import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import '../../../cubits/login_and_signup/LoginCubit.dart';
import '../../../generated/l10n.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final TextEditingController _identifierController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<LoginCubit>();
    final state = cubit.state;
    String identifier = '';
    String password = '';

    if (state is LoginInitial) {
      identifier = state.identifier;
      password = state.password;
    }

    _identifierController = TextEditingController(text: identifier);
    _passwordController = TextEditingController(text: password);

    _identifierController.addListener(() {
      cubit.updateIdentifier(_identifierController.text);
    });

    _passwordController.addListener(() {
      cubit.updatePassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1000,
            minWidth: 300,
          ),
          child: FractionallySizedBox(
            widthFactor: MediaQuery.of(context).size.width > 600 ? 0.5 : 1,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                final isLoading = state is LoginLoading;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      s.welcome_back,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _identifierController,
                      decoration: InputDecoration(
                        labelText: s.emailOrUsername,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      enabled: !isLoading,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: s.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      obscureText: true,
                      enabled: !isLoading,
                    ),
                    const SizedBox(height: 8),
                    // 👇 Добавлена кнопка восстановления
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.read<StartupCubit>().showPasswordRecoveryScreen();
                        },
                        child: Text(
                          s.forgotPassword, // добавь это в l10n (пример ниже)
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        context.read<LoginCubit>().submit();
                      },
                      child: Text(
                        s.continue_next,
                        style: TextStyle(fontSize: 16, ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      s.noAccount,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed:
                      context.read<StartupCubit>().showRegistrationScreen,
                      child: Text(
                        S.of(context).registration,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
