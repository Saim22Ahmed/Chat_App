import 'package:flutter/material.dart';

const themecolor = Colors.grey;

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
      background: themecolor.shade900,
      primary: themecolor.shade600,
      secondary: themecolor.shade700,
      tertiary: themecolor.shade800,
      inversePrimary: themecolor.shade300),
);
