import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../generated/l10n.dart';

class DeckCreatingWidget extends StatefulWidget {
  const DeckCreatingWidget({super.key});

  @override
  State<DeckCreatingWidget> createState() => _DeckCreatingWidgetState();
}

class _DeckCreatingWidgetState extends State<DeckCreatingWidget> {
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
    super.didChangeDependencies();if (nameController.text.isEmpty) {
      nameController.text = S.of(context).unnamed;
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
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: double.infinity),
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
                      onTap: () {
                        if (nameController.text == S.of(context).unnamed) {
                          nameController.clear();
                        }
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: S.of(context).title,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: S.of(context).descriptionOptional,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: Text(S.of(context).makeDeckPublic)),
                        Switch(
                          value: isPublic,
                          onChanged: (value) {
                            setState(() {
                              isPublic = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => context.read<EditScreensCubit>().cancelCreatingDeck(),
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                              context.read<EditScreensCubit>().saveDeck(
                                title: nameController.text.trim(),
                                description: descriptionController.text.trim(),
                                isPublic: isPublic,
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
