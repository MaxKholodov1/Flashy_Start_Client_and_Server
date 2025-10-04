import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../../generated/l10n.dart';

class MoreMenuButton extends StatelessWidget {

  const MoreMenuButton({
    super.key,
  });

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final learningCubit = BlocProvider.of<LearningScreensCubit>(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(S.of(context).delete_confirmation),
          content: Text(S.of(context).areYouSureYouWantToDeleteTheDeckLocally),
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
                learningCubit.deleteProgressDeck();
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
          value: 'delete deck',
          child: Text(S.of(context).deleteTheDeckLocally),
        ),
      ],
      onSelected: (String value) async {
        switch (value) {
          case 'delete deck':
            await _showDeleteConfirmationDialog(context);
            break;
        }
      },
    );
  }
}
