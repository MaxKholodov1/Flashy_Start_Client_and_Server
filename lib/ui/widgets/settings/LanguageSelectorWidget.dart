import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/DisplayCubit.dart';
import '../../../generated/l10n.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCode = context.watch<DisplayCubit>().state.locale.languageCode;
    const languages = {'en': 'English', 'ru': 'Русский'};

    return Builder(
      builder: (innerContext) {
        return ListTile(
          title: Text(S.of(context).language),
          subtitle: Text(languages[currentCode] ?? currentCode),
          trailing: const Icon(Icons.arrow_drop_down),
          onTap: () async {
            final RenderBox tileBox = innerContext.findRenderObject() as RenderBox;
            final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

            final tilePosition = tileBox.localToGlobal(Offset.zero, ancestor: overlay);
            final tileSize = tileBox.size;

            final selected = await showMenu<String>(
              context: context,
              position: RelativeRect.fromLTRB(
                tilePosition.dx + tileSize.width, // меню справа от кнопки
                tilePosition.dy,
                tilePosition.dx,
                overlay.size.height - tilePosition.dy - tileSize.height,
              ),
              items: languages.entries.map((entry) {
                final isSelected = entry.key == currentCode;
                return PopupMenuItem<String>(
                  value: entry.key,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.value),
                      if (isSelected) const Icon(Icons.check, color: Colors.blue),
                    ],
                  ),
                );
              }).toList(),
            );

            if (selected != null) {
              context.read<DisplayCubit>().changeLocaleCode(selected);
            }
          },
        );
      },
    );
  }
}
