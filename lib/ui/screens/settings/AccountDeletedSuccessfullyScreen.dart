import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login_and_signup/StartupCubit.dart';
import '../../../generated/l10n.dart';

class AccountDeletedSuccessFullyScreen extends StatefulWidget {

  const AccountDeletedSuccessFullyScreen({Key? key}) : super(key: key);

  @override
  _AccountDeletedSuccessFullyScreenState createState() => _AccountDeletedSuccessFullyScreenState();
}

class _AccountDeletedSuccessFullyScreenState extends State<AccountDeletedSuccessFullyScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<StartupCubit>().showAuthorizationScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).accountDeletedTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            S.of(context).accountDeletedMessage,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
