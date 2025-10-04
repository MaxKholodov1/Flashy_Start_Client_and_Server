import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../domain/entities/GlobalCard.dart';
import '../../../../generated/l10n.dart';

class EditingCardWidget extends StatefulWidget {
  final GlobalCard globalCard;

  const EditingCardWidget({
    super.key,
    required this.globalCard
  });

  @override
  State<EditingCardWidget> createState() => _EditingCardWidgetState();
}

class _EditingCardWidgetState extends State<EditingCardWidget> {
  late final TextEditingController questionController;
  late final TextEditingController answerController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.globalCard.question);
    answerController = TextEditingController(text: widget.globalCard.answer);
  }

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double targetWidth = screenWidth / 2 < 600 ? 600 : screenWidth / 2;

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 600,
              maxWidth: targetWidth,
            ),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: questionController,
                      decoration: InputDecoration(
                        labelText: S.of(context).question,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: answerController,
                      decoration: InputDecoration(
                        labelText: S.of(context).answer,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<EditScreensCubit>().cancelEditingCard();
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<EditScreensCubit>().updateCard(question: questionController.text.trim(),
                                answer: answerController.text.trim());
                            // context.read<EditScreensCubit>().saveEditedGlobalCard(
                            //   question: questionController.text.trim(),
                            //   answer: answerController.text.trim(),
                            //   deckID: (context.read<EditScreensCubit>().state as EditingCardScreenState).globalDeckInfo.globalDeck.ID,
                            //   cardID: (context.read<EditScreensCubit>().state as EditingCardScreenState).globalCard.ID,
                            // );
                          },
                          child: Text(
                            S.of(context).save,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
