import 'package:flutter/material.dart';

const themecolor = Colors.grey;

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
      background: themecolor.shade300,
      primary: themecolor.shade500,
      secondary: themecolor.shade200,
      tertiary: Colors.white,
      inversePrimary: themecolor.shade900),
);
