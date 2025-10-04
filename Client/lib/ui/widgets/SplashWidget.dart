import 'package:flutter/material.dart';

import '../../generated/l10n.dart';


class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 229, 227),
      body: Center(
        child: Text(S.of(context).welcome,
          style:
          TextStyle(
            color: Color.fromARGB(253, 0, 0, 0),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
          ),
        )
      ),
    );
  }
}
