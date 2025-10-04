import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/generated/FailureCodeLocalizer.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/SettingsScreenCubit.dart';
import '../../../generated/l10n.dart';
import '../../themes/app_colors.dart';

class EditingPasswordScreen extends StatefulWidget {
  const EditingPasswordScreen({super.key});

  @override
  State<EditingPasswordScreen> createState() => _EditingPasswordScreenState();
}

class _EditingPasswordScreenState extends State<EditingPasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _snackbarShown = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<SettingsScreenCubit>().state as EditingPasswordScreenState;
    if (!_snackbarShown &&
        state.showSnackBarMessage == true &&
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

  void _onSubmit() {
    final oldPassword = _oldPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty) {
      Flushbar(
        message: S.of(context).pleaseFillInBothFields,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      return;
    }

    context.read<SettingsScreenCubit>().changePassword(
      password: oldPassword,
      newPassword: newPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final theme = Theme.of(context);
    return BlocBuilder<SettingsScreenCubit, SettingsScreenState>(
      builder: (context, state) {
        if (state is! EditingPasswordScreenState) {
          return const SizedBox.shrink();
        }
        return Scaffold(
          backgroundColor: colors.backGround,
          appBar: AppBar(
              title: Text(S.of(context).editPassword),
            leading: BackButton(
              onPressed: context.read<SettingsScreenCubit>().backToAccountScreen,
            ),
          ),
          body: BlocListener<SettingsScreenCubit, SettingsScreenState>(
            listener: (context, listenerState) {
              if (listenerState is EditingPasswordScreenState && listenerState.showSnackBarMessage == true &&
                  listenerState.failureCode != null) {
                Flushbar(
                  message: getFailureMessage(context, listenerState.failureCode!),
                  duration: const Duration(seconds: 3),
                  margin: const EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(8),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextField(
                      controller: _oldPasswordController,
                      obscureText: !_showOldPassword,
                      decoration: InputDecoration(
                        labelText: S.of(context).oldPassword,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: Icon(_showOldPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() => _showOldPassword = !_showOldPassword);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _newPasswordController,
                      obscureText: !_showNewPassword,
                      decoration: InputDecoration(
                        labelText: S.of(context).newPassword,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: Icon(_showNewPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() => _showNewPassword = !_showNewPassword);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.cardBackGroundColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: _onSubmit,
                        child: Text(S.of(context).updatePassword, style: theme.textTheme.bodyLarge,),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        context.read<StartupCubit>().showPasswordRecoveryScreen();
                      },
                      child: Text(
                        S.of(context).forgotPassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

