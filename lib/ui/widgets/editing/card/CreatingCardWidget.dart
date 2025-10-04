import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../../generated/l10n.dart';


class CreatingCardWidget extends StatefulWidget {
  const CreatingCardWidget({super.key});

  @override
  State<CreatingCardWidget> createState() => _CreatingCardWidgetState();
}

class _CreatingCardWidgetState extends State<CreatingCardWidget> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  bool isPublic = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (nameController.text.isEmpty) {
      nameController.text;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
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
                      controller: nameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: S.of(context).question,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: S.of(context).answer,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){
                            context.read<EditScreensCubit>().cancelCreatingCard();
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<EditScreensCubit>().createGlobalCard(
                              question: nameController.text.trim(),
                              answer: descriptionController.text.trim(),
                              deckID: (context.read<EditScreensCubit>().state as CreatingCardScreenState).globalDeckInfo.globalDeck.ID
                            );
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
