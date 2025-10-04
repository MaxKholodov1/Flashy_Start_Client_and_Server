import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DelayedProgressIndicator extends StatefulWidget {
  final bool isChecking;
  final Widget button;

  const DelayedProgressIndicator({
    super.key,
    required this.isChecking,
    required this.button,
  });

  @override
  State<DelayedProgressIndicator> createState() => _DelayedProgressIndicatorState();
}

class _DelayedProgressIndicatorState extends State<DelayedProgressIndicator> {
  bool _showSpinner = false;
  Timer? _timer;

  @override
  void didUpdateWidget(covariant DelayedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isChecking && !oldWidget.isChecking) {
      // Запустили проверку — начинаем таймер
      _timer = Timer(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _showSpinner = true;
          });
        }
      });
    } else if (!widget.isChecking && oldWidget.isChecking) {
      // Проверка закончилась — отменяем таймер и скрываем спиннер
      _timer?.cancel();
      _timer = null;
      setState(() {
        _showSpinner = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isChecking) {
      if (_showSpinner) {
        return const Center(child: CircularProgressIndicator());
      } else {
        // Менее 1 секунды — показываем кнопку (то есть передаем кнопку как child)
        return widget.button;
      }
    } else {
      // Не проверяем — показываем кнопку
      return widget.button;
    }
  }
}
