import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'AccountButtonWidget.dart';
import 'FontSizeSelectorWidget.dart';
import 'LanguageSelectorWidget.dart';
import 'ThemeSelectorWidget.dart';

class MainSettingsErrorWidget extends StatelessWidget {
  final String errorMessage;
  final void Function(BuildContext) onRetry;
  final String buttonMessage;

  const MainSettingsErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    required this.buttonMessage,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body:  Column(
        children: [
          MaterialBanner(
            content: Text(errorMessage),
            leading: const Icon(Icons.error_outline, color: Colors.red),
            backgroundColor: Colors.red.shade50,
            actions: [
              TextButton(
                onPressed: (){onRetry(context);},
                child: Text(buttonMessage),
              ),
            ],
          ),
          AccountButtonWidget(),
          const ThemeSelectorWidget(),
          const LanguageSelectorWidget(),
          const FontSizeSelectorWidget(),
        ],
      ),
    );
  }
}
