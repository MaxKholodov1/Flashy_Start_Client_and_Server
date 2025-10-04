import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../themes/app_colors.dart';

class ViewEditorsWidget extends StatelessWidget {
  final String authorName;
  final List<String>? editors;
  final VoidCallback onClose; // добавляем параметр для функции закрытия

  const ViewEditorsWidget({
    super.key,
    required this.editors,
    required this.authorName,
    required this.onClose, // обязательный параметр в конструкторе
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
          maxWidth: targetWidth,
        ),
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
                  onPressed: onClose, // вызываем callback из параметров
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
