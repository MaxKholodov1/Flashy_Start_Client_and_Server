import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditingStates.dart';
import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../generated/l10n.dart';
import '../../themes/app_colors.dart';

class EditingEditorsWidget extends StatefulWidget {
  final List<String>? editors;
  final String author;
  final double targetWidth;

  const EditingEditorsWidget({
    super.key,
    required this.editors,
    required this.author,
    this.targetWidth = 800,
  });

  @override
  State<EditingEditorsWidget> createState() => _EditingEditorsWidgetState();
}

class _EditingEditorsWidgetState extends State<EditingEditorsWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _showTextField = false;

  void _addEditor() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<EditScreensCubit>().addEditorToGlobalDeck(text);
      setState(() {
        _controller.clear();
        _showTextField = false;
      });
    }
  }

  void _cancel() {
    setState(() {
      _controller.clear();
      _showTextField = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final editors = widget.editors;
    final bool hasEditors = editors != null && editors.isNotEmpty;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 600,
        maxWidth: widget.targetWidth,
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.backGround,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Контент
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).author}:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    widget.author,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "${S.of(context).editors}:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (hasEditors)
                  ...editors.map(
                        (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                else
                  Text(
                    S.of(context).no_editors_yet,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                const SizedBox(height: 16),

                if (_showTextField) ...[
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: S.of(context).enter_editor_name,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _cancel,
                        child: Text(S.of(context).cancel),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: _addEditor,
                        child: Text(S.of(context).add),
                      ),
                    ],
                  ),
                ] else
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _showTextField = true;
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: Text(S.of(context).add_editor),
                    ),
                  ),
              ],
            ),

            // Кнопка "выход"
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  final state = context.read<EditScreensCubit>().state;
                  if (state is EditingEditorsScreenState) {
                    context.read<EditScreensCubit>().showGlobalDeckInfo(
                      state.globalDeckInfo.globalDeck.ID,
                      state.globalDeckInfo.globalDeck.title,
                      state.globalDeckInfo.globalDeck.description,
                      null,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EditorsWidget extends StatelessWidget {
  final String authorName;
  final List<String>? editors;

  const EditorsWidget({
    super.key,
    required this.editors,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final screenWidth = MediaQuery.of(context).size.width;
    final double targetWidth = screenWidth / 2 < 600 ? 600 : screenWidth / 2;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 600,
          maxWidth: targetWidth,),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.backGround,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // Контент
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "${S.of(context).author}:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authorName,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${S.of(context).editors}:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (editors == null || editors!.isEmpty)
                     Text(
                       S.of(context).no_editors_yet,
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    )
                  else
                    ...editors!.map(
                          (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                ],
              ),

              // Кнопка закрытия
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    final deckId = (context.read<EditScreensCubit>().state as EditingEditorsScreenState)
                        .globalDeckInfo
                        .globalDeck
                        .ID;
                    final title = (context.read<EditScreensCubit>().state as EditingEditorsScreenState)
                        .globalDeckInfo
                        .globalDeck.title;
                    final description= (context.read<EditScreensCubit>().state as EditingEditorsScreenState)
                        .globalDeckInfo
                        .globalDeck.description;

                    context.read<EditScreensCubit>().showGlobalDeckInfo(deckId,title, description, null);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}