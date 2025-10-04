import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../generated/l10n.dart';

class DeckEditingInfoWidget extends StatefulWidget {
  final String initialTitle;
  final String initialDescription;

  const DeckEditingInfoWidget({
    super.key,
    required this.initialTitle,
    required this.initialDescription,
  });

  @override
  State<DeckEditingInfoWidget> createState() => _DeckEditingInfoWidgetState();
}

class _DeckEditingInfoWidgetState extends State<DeckEditingInfoWidget> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialTitle);
    descriptionController = TextEditingController(text: widget.initialDescription);
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
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<EditScreensCubit>().cancelEditingDeckInfo();
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<EditScreensCubit>().updateGlobalDeckInfo(
                              nameController.text.trim(),
                              descriptionController.text.trim(),
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
