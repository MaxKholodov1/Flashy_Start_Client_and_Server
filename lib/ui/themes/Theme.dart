library Theme;

import 'package:flutter/material.dart';

import '../../domain/entities/Settings.dart';
import 'app_colors.dart';

part 'DarkTheme.dart';
part 'LightTheme.dart';
part 'TextTheme.dart';

ThemeData darkTheme(Settings settings) => createDarkTheme(settings);
ThemeData lightTheme(Settings settings) => createLightTheme(settings);
