import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../domain/entities/GlobalCard.dart';
import '../../../../generated/l10n.dart';

class CardWidget extends StatelessWidget {
  final GlobalCard globalCard;
  final double Function() getCurrentOffset;

  const CardWidget({
    super.key,
    required this.globalCard,
    required this.getCurrentOffset,
  });

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title:  Text(S.of(context).delete_card_question),
        content: Text(S.of(context).delete_card_confirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<EditScreensCubit>().deleteCard(globalCard.ID);
              Navigator.of(ctx).pop();
            },
            child: Text(
              S.of(context).delete,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final offset = getCurrentOffset();
        context.read<EditScreensCubit>().showEditingCardScreen(offset, globalCard);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Верхняя строка с вопросом и кнопкой
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Текст вопроса
                Expanded(
                  child: Text(
                    globalCard.question,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                /// Кнопка действий
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      _confirmDelete(context);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Удалить'),
                    ),
                  ],
                  icon: const Icon(Icons.more_vert, size: 20),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Ответ
            Text(
              globalCard.answer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
