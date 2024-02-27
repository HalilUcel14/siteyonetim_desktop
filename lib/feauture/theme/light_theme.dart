import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

final class LightTheme extends ITheme {
  @override
  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButton,
      );

  @override
  ColorScheme get colorScheme => const ColorScheme.light(
        primary: Color(0xFF4CAF50),
        primaryContainer: Color.fromARGB(255, 69, 233, 74),
        secondary: Color(0xFF607D8B),
        secondaryContainer: Color.fromARGB(255, 70, 135, 168),
        tertiary: Color(0xFFB0BEC5),
        tertiaryContainer: Color.fromARGB(255, 143, 177, 194),
        onPrimary: Colors.black,
        onPrimaryContainer: Colors.black87,
        onSecondary: Colors.white70,
        onSecondaryContainer: Colors.white,
      );

  @override
  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          animationDuration: DurationConst.millisecond(300).duration,
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
