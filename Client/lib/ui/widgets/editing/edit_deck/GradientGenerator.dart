import 'dart:math';
import 'package:flutter/material.dart';

class GradientGenerator {
  static Color getTopColorFromId(int id) {
    final random = Random(id);
    final h1 = random.nextDouble() * 360;
    return HSLColor.fromAHSL(1.0, h1, 0.4, 0.6).toColor();
  }
}
