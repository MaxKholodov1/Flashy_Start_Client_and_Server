import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'AccountButtonWidget.dart';
import 'FontSizeSelectorWidget.dart';
import 'LanguageSelectorWidget.dart';
import 'ThemeSelectorWidget.dart';

class MainSettingsWidget extends StatelessWidget {

  const MainSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body:  Column(
        children: [
          AccountButtonWidget(),
          const ThemeSelectorWidget(),
          const LanguageSelectorWidget(),
          const FontSizeSelectorWidget(),
        ],
      ),
    );
  }
}
