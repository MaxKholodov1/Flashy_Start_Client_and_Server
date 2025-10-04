import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';

import '../../../generated/FailureCodeLocalizer.dart';
import '../../../generated/l10n.dart';

class EmailVerificationScreenWidget extends StatefulWidget {
  const EmailVerificationScreenWidget({super.key});

  @override
  State<EmailVerificationScreenWidget> createState() =>
      _EmailVerificationScreenWidgetState();
}

class _EmailVerificationScreenWidgetState
    extends State<EmailVerificationScreenWidget> {
  final TextEditingController _codeController = TextEditingController();
  String? _errorText;

  bool _canResend = true;
  int _secondsLeft = 0;
  Timer? _timer;

  void _submit() {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      setState(() => _errorText = S.of(context).enter_code_from_email);
      return;
    }
    context.read<StartupCubit>().verifyEmailFunction(code);
  }

  void _startCooldown() {
    setState(() {
      _canResend = false;
      _secondsLeft = 30;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _resendCode() {
    context.read<StartupCubit>().sendVerificationCode();
    _startCooldown();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocListener<StartupCubit, StartupState>(
      listener: (context, state) {
        if (state is EmailVerification && state.failureCode != null) {
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
        appBar: AppBar(title: Text(s.email_verification)),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      s.email_sent_description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: s.verification_code,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorText: _errorText,
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
                      onPressed: _submit,
                      child: Text(
                        s.confirm,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _canResend ? _resendCode : null,
                      child: Text(
                        _canResend
                            ? s.resend_code
                            : '${s.resend_in} $_secondsLeft сек.',
                        style: const TextStyle(fontSize: 14),
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
