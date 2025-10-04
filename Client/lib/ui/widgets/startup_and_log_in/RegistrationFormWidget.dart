import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../cubits/login_and_signup/RegistrationCubit.dart';
import '../../../generated/l10n.dart';
import 'DelayedProgressIndicator.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({super.key});

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
            child: BlocConsumer<RegistrationCubit, RegistrationState>(
              listenWhen: (previous, current) {
                if (previous is RegistrationFieldsState &&
                    current is RegistrationFieldsState) {
                  return previous.showErrorSnackbar != current.showErrorSnackbar &&
                      current.showErrorSnackbar;
                }
                return (current is RegistrationSuccess) ||(current is RegistrationDefUserSuccess);
              },
              listener: (context, state) {
                if (state is RegistrationFieldsState && state.showErrorSnackbar) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessageSnackBar),
                      action: SnackBarAction(
                        label: s.refresh,
                        onPressed: () {
                          final cubit = context.read<RegistrationCubit>();
                          cubit.userNameChanged(state.userName);
                          cubit.userEmailChanged(state.userEmail);
                          cubit.passwordChanged(state.password);
                        },
                      ),
                    ),
                  );
                } else if (state is RegistrationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(s.registration_successful)),
                  );
                  context.read<StartupCubit>().showEmailVerificationScreen(state.userID);
                }else if (state is RegistrationDefUserSuccess){
                  context.read<StartupCubit>().showFinishScreen(state.userID);
                }
              },
              builder: (context, state) {
                if (state is! RegistrationFieldsState) {
                  return const SizedBox.shrink();
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      s.createAccount,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        labelText: s.username,
                        errorText: state.userNameError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value) => context.read<RegistrationCubit>().userNameChanged(value),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: state.userEmailError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value) => context.read<RegistrationCubit>().userEmailChanged(value),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: s.password,
                        errorText: state.passwordError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value) => context.read<RegistrationCubit>().passwordChanged(value),
                    ),
                    const SizedBox(height: 24),
                    DelayedProgressIndicator(
                      isChecking: state.isChecking,
                      button: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          context.read<RegistrationCubit>().registerUser();
                        },
                        child: Text(
                          s.sign_up,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: ( ){context.read<RegistrationCubit>().registerDefUser();},
                        child: Text(
                        S.of(context).skip,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      s.already_have_account,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: context.read<StartupCubit>().showAuthorizationScreen,
                      child: Text(
                        S.of(context).logIn,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16),

                    SelectableText.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                        children: [
                          const TextSpan(text: 'By signing up, you agree to our '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url = Uri.parse('https://flashystart.com/privacy.html');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Could not launch privacy policy link')),
                                  );
                                }
                              },
                          ),
                          const TextSpan(text: '.\n\nLink: '),
                          const TextSpan(
                            text: 'https://flashystart.com/privacy.html',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
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
