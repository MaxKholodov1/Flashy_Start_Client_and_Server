import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import '../../../generated/FailureCodeLocalizer.dart';
import '../../../generated/l10n.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final _controller = TextEditingController();
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final state = context.read<StartupCubit>().state;
    if (!_snackbarShown &&
        state is PasswordRecoveryState &&
        state.failureCode != null) {
      _snackbarShown = true;
      Future.microtask(() {
        Flushbar(
          message: getFailureMessage(context, state.failureCode!),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocListener<StartupCubit, StartupState>(
      listener: (context, state) {
        if (state is PasswordRecoveryState && state.failureCode != null) {
          Flushbar(
            message: getFailureMessage(context, state.failureCode!),
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(16),
            borderRadius: BorderRadius.circular(8),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent, // Прозрачный фон
            elevation: 0,
          leading: BackButton(
            onPressed: context.read<StartupCubit>().showAuthorizationScreen,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
                minWidth: 300,
              ),
              child: FractionallySizedBox(
                widthFactor: MediaQuery.of(context).size.width > 600 ? 0.5 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      s.recoverPassword,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: s.emailOrUsername,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        final input = _controller.text.trim();
                        if (input.isNotEmpty) {
                          context.read<StartupCubit>().passwordRecovery(input);
                          _snackbarShown = false;
                        }
                      },
                      child: Text(
                        s.recover,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
