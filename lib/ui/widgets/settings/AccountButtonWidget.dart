import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/SettingsScreenCubit.dart';
import '../../../generated/l10n.dart';

class AccountButtonWidget extends StatelessWidget {

  const AccountButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).account),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15,),
      onTap: (){
        context.read<SettingsScreenCubit>().showAccountScreen();
      },
    );
  }
}
