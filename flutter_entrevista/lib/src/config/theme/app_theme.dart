import 'package:flutter/material.dart';
class Apptheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.amberAccent,
      appBarTheme: const AppBarTheme(centerTitle: true),
      brightness: Brightness.dark
      );
}
