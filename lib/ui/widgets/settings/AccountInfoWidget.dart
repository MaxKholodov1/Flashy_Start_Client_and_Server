import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/domain/entities/User.dart';
import 'package:flashy_start/cubits/SettingsScreenCubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../generated/l10n.dart';

class AccountInfoWidget extends StatelessWidget {
  final User user;

  const AccountInfoWidget({super.key, required this.user});
  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final cubit = BlocProvider.of<SettingsScreenCubit>(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(S.of(context).delete_confirmation),
          content: Text(S.of(context).confirm_user_delete),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            TextButton(
              child: Text(S.of(context).delete, style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                // Используем ранее полученный cubit
                cubit.deleteUser();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final registrationDateFormatted = user.createdAt != null
        ? DateFormat.yMMMMd().format(user.createdAt!)
        : 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).account),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<SettingsScreenCubit>().emit(MainSettingsScreen());
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(S.of(context).username, user.userName),
            _buildInfoRow(S.of(context).email, user.email),
            _buildInfoRow(S.of(context).registeredOn, registrationDateFormatted),
            const Spacer(),
            Column(
              children: [
                SelectableText.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: S.of(context).privacyPolicy,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url =
                            Uri.parse('https://flashystart.com/privacy.html');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Could not launch privacy policy link',
                                  ),
                                ),
                              );
                            }
                          },
                      ),
                      const TextSpan(text: '.'),

                      // перенос строки и просто текст ссылки
                      const TextSpan(
                        text: '(https://flashystart.com/privacy.html)',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context);
                    },
                    child: Text(S.of(context).deleteAccount),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SettingsScreenCubit>().showEditingPasswordScreen();
                    },
                    child: Text(S.of(context).changePassword),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<StartupCubit>().logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(S.of(context).logOut),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('$title: '),
          Flexible(child: Text(value)),
        ],
      ),
    );
  }
}
