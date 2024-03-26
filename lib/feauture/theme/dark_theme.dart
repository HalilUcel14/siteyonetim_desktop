import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

final class DarkTheme extends ITheme {
  @override
  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButton,
      );

  @override
  ColorScheme get colorScheme => const ColorScheme.dark(
        primary: Color(0xFF4CAF50),
        primaryContainer: Color.fromARGB(255, 69, 233, 74),
        onPrimary: Colors.black,
        onPrimaryContainer: Colors.black87,
        //---------------------------------
        secondary: Color(0xFF607D8B),
        secondaryContainer: Color.fromARGB(255, 70, 135, 168),
        onSecondary: Colors.white70,
        onSecondaryContainer: Colors.white,
        //---------------------------------
        tertiary: Color(0xFFB0BEC5),
        tertiaryContainer: Color.fromARGB(255, 143, 177, 194),

        //---------------------------------
        background: Colors.black87,
        onBackground: Colors.white,

        //---------------------------------

        surfaceTint: Colors.blueGrey,
        //
        shadow: Color(0xFFC5C5C5),
      );

  @override
  ElevatedButtonThemeData get elevatedButton => const ElevatedButtonThemeData();
}
