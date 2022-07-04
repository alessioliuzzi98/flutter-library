import 'package:flutter/material.dart';

class CustomThemeData {
  // the primary color of the application
  static const Color _primaryColor = Colors.redAccent;

  // visual density that is adaptive based on the defaultTargetPlatform
  static final VisualDensity _visualDensity =
      VisualDensity.adaptivePlatformDensity;

  static ThemeData lightThemeData() => ThemeData(
        primaryColor: _primaryColor,
        visualDensity: _visualDensity,
        brightness: Brightness.light,
      );

  static ThemeData darkThemeData() => ThemeData(
        primaryColor: _primaryColor,
        visualDensity: _visualDensity,
        brightness: Brightness.dark,
      );
}
