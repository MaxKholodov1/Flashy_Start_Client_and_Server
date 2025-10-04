import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/widgets/editing/main/MainEditScreenWidget.dart';
import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../generated/l10n.dart';
import '../../themes/app_colors.dart';
import '../../widgets/NavigationWidget.dart';


class MainEditingScreen extends StatelessWidget {
  const MainEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sstate = context.read<EditScreensCubit>().state as MainEditingScreenState;
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: colors.surfaceBackground,
      appBar: AppBar(
        title: Text(S.of(context).editTheDecks),
        actions: [
          if (sstate.refreshButton == true)
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: S.of(context).refresh,
              onPressed: () {
                context.read<EditScreensCubit>().init;
              },
            ),
        ],
      ),
      body: MainEditScreenWidget(editableGlobalDecks: sstate.editableGlobalDecks,  initialOffset: context.read<EditScreensCubit>().getMainEditingOffset(),),
      bottomNavigationBar: SafeArea(
        top: false, // не добавлять отступ сверху для NavigationWidget
        child: const NavigationWidget(),
      ),

    );
  }
}
