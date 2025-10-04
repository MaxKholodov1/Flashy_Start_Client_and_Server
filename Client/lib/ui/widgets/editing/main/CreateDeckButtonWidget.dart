import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';

class CreateDeckButtonWidget extends StatelessWidget {

  const CreateDeckButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return
      Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: colors.cardBackGroundColor,
        child: ListTile(
          leading: const Icon(Icons.add),
          title: Text(S.of(context).addNewDeck),
          onTap: () => context.read<EditScreensCubit>().showCreateDeckScreen(),
        ),
      );
  }
}
