import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class TextBlockForDeckWidget extends StatefulWidget {
  final String label;
  final String content;
  final TextStyle? labelStyle;
  final TextStyle? contentStyle;

  const TextBlockForDeckWidget({
    super.key,
    required this.label,
    required this.content,
    this.labelStyle,
    this.contentStyle,
  });

  @override
  State<TextBlockForDeckWidget> createState() => _TextBlockForDeckWidgetState();
}

class _TextBlockForDeckWidgetState extends State<TextBlockForDeckWidget> {
  bool _expanded = false;
  bool _needsExpandButton = false;
  final GlobalKey _textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Стиль для label с возможностью переопределения
    final labelStyle = widget.labelStyle ?? Theme.of(context).textTheme.labelSmall?.copyWith(
      color: Colors.grey[400],
    );

    // Базовый стиль для content с возможностью переопределения
    final baseContentStyle = widget.contentStyle ?? Theme.of(context).textTheme.bodyLarge;
    final contentStyle = baseContentStyle?.copyWith(
      fontFamily: 'monospace',
      color: Theme.of(context).colorScheme.onSurface,
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.label != "")...[
            Text(
              widget.label,
              style: labelStyle, // Используем переданный или дефолтный стиль
            ),
            const SizedBox(height: 4),
          ],
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(text: widget.content, style: contentStyle),
                maxLines: 3,
                textDirection: TextDirection.ltr,
              );
              textPainter.layout(maxWidth: constraints.maxWidth);

              if (_needsExpandButton != textPainter.didExceedMaxLines) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _needsExpandButton = textPainter.didExceedMaxLines;
                    });
                  }
                });
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content,
                    key: _textKey,
                    style: contentStyle, // Используем переданный или дефолтный стиль
                    maxLines: _expanded ? null : 3,
                    overflow: _expanded ? null : TextOverflow.ellipsis,
                  ),
                  if (_needsExpandButton)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => setState(() => _expanded = !_expanded),
                        child: Text(_expanded ? S.of(context).hide : S.of(context).showMore),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}