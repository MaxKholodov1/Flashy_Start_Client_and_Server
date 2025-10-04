import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/DisplayCubit.dart';
import '../../../generated/l10n.dart';

class FontSizeSelectorWidget extends StatelessWidget {
  const FontSizeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.watch<DisplayCubit>().state.scaleForFontSize;
    const sizes = [0.8, 0.9, 1.0, 1.1, 1.2, 1.3];

    return Builder(
      builder: (innerContext) {
        return ListTile(
          title: Text(S.of(context).fontSize),
          subtitle: Text("${(scale * 100).toInt()}%"),
          trailing: const Icon(Icons.arrow_drop_down),
          onTap: () async {
            final RenderBox tileBox = innerContext.findRenderObject() as RenderBox;
            final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

            final tilePosition = tileBox.localToGlobal(Offset.zero, ancestor: overlay);
            final tileSize = tileBox.size;

            final selected = await showMenu<double>(
              context: context,
              position: RelativeRect.fromLTRB(
                tilePosition.dx + tileSize.width, // слева меню будет сразу справа от кнопки
                tilePosition.dy,                  // верх меню совпадает с верхом кнопки
                tilePosition.dx,                 // правая граница меню — там, где кнопка слева
                overlay.size.height - tilePosition.dy - tileSize.height,
              ),
              items: sizes.map((s) {
                final isSelected = s == scale;
                return PopupMenuItem<double>(
                  value: s,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(s * 100).toInt()}%"),
                      if (isSelected) const Icon(Icons.check, color: Colors.blue),
                    ],
                  ),
                );
              }).toList(),
            );

            if (selected != null) {
              context.read<DisplayCubit>().changeScaleForFontSize(selected);
            }
          },
        );
      },
    );
  }
}
