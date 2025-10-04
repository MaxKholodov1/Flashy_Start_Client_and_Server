import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/domain/entities/GlobalDeckInfo.dart';

import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../domain/entities/GlobalCard.dart';
import '../../../../generated/l10n.dart';

class MoreMenuButtonForAuthor extends StatelessWidget {
  final GlobalDeckInfo globalDeckInfo;
  final List<GlobalCard>? globalCards;

  const MoreMenuButtonForAuthor({
    super.key,
    required this.globalCards,
    required this.globalDeckInfo,
  });

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final editCubit = BlocProvider.of<EditScreensCubit>(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(S.of(context).delete_confirmation),
          content: Text(S.of(context).confirm_deck_delete),
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
                editCubit.deleteGlobalDeck(globalDeckInfo.globalDeck.ID);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, size: 35),
      offset: const Offset(40, 40), // Смещение меню относительно кнопки (правее и ниже)
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'add card',
          child: Text(S.of(context).addCard),
        ),
        PopupMenuItem<String>(
          value: 'delete deck',
          child: Text(S.of(context).delete_deck),
        ),
        PopupMenuItem<String>(
          value: 'modify editors',
          child: Text(S.of(context).assign_or_remove_editors),
        ),
      ],
      onSelected: (String value) async {
        final editCubit = BlocProvider.of<EditScreensCubit>(context);

        switch (value) {
          case 'add card':
            editCubit.showCreatingCardScreen(globalDeckInfo, globalCards);
            break;
          case 'delete deck':
            await _showDeleteConfirmationDialog(context);
            break;
          case 'modify editors':
            context.read<EditScreensCubit>().showEditingEditorsScreen();
            break;
        }
      },
    );
  }
}

class MoreMenuButtonForEditor extends StatelessWidget {
  final GlobalDeckInfo globalDeckInfo;
  final List<GlobalCard>? globalCards;

  const MoreMenuButtonForEditor({
    super.key,
    required this.globalCards,
    required this.globalDeckInfo,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, size: 35),
      offset: const Offset(40, 40), // Смещение меню относительно кнопки
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'add card',
          child: Text(S.of(context).addCard),
        ),
        PopupMenuItem<String>(
          value: 'editors',
          child: Text(S.of(context).editors),
        ),
      ],
      onSelected: (String value) {
        final editCubit = BlocProvider.of<EditScreensCubit>(context);

        switch (value) {
          case 'add card':
            editCubit.showCreatingCardScreen(globalDeckInfo, globalCards);
            break;
          case 'editors':
            context.read<EditScreensCubit>().showEditingEditorsScreen();
            break;
        }
      },
    );
  }
}
