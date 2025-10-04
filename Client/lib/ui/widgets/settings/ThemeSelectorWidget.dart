import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/DisplayCubit.dart';
import '../../../generated/l10n.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = context.watch<DisplayCubit>().state.isLightMode;

    return Builder(
      builder: (innerContext) {
        return ListTile(
          title: Text(S.of(context).theme),
          subtitle: Text(isLight ? S.of(context).lightMode : S.of(context).darkMode),
          trailing: const Icon(Icons.arrow_drop_down),
          onTap: () async {
            final RenderBox tileBox = innerContext.findRenderObject() as RenderBox;
            final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

            final tilePosition = tileBox.localToGlobal(Offset.zero, ancestor: overlay);
            final tileSize = tileBox.size;

            final selected = await showMenu<bool>(
              context: context,
              position: RelativeRect.fromLTRB(
                tilePosition.dx + tileSize.width, // справа от кнопки
                tilePosition.dy,
                tilePosition.dx,
                overlay.size.height - tilePosition.dy - tileSize.height,
              ),
              items: [
                PopupMenuItem(
                  value: true,
                  child: _buildItem(context, S.of(context).lightMode, isLight),
                ),
                PopupMenuItem(
                  value: false,
                  child: _buildItem(context, S.of(context).darkMode, !isLight),
                ),
              ],
            );

            if (selected != null) {
              context.read<DisplayCubit>().toggleTheme(selected);
            }
          },
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String text, bool selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        if (selected) const Icon(Icons.check, color: Colors.blue),
      ],
    );
  }
}
