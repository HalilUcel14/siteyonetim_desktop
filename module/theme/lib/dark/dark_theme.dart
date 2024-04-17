import 'package:flutter/material.dart';
import 'package:theme/index.dart';

final class DarkTheme extends BaseTheme {
  @override
  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButton,
        cardTheme: cardTheme,
        appBarTheme: appBar,
        drawerTheme: drawer,
      );

  DrawerThemeData get drawer => DrawerThemeData(
        width: 256,
        elevation: 16,
        shadowColor: colorScheme.shadow,
      );

  AppBarTheme get appBar => AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
          fontSize: 24,
        ),
      );

  CardTheme get cardTheme => CardTheme(
        color: colorScheme.tertiaryContainer,
        shadowColor: colorScheme.shadow,
        elevation: 16,
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
        surface: Colors.black87,
        onSurface: Colors.white,

        //---------------------------------

        surfaceTint: Colors.blueGrey,
        //
        shadow: Color(0xFFC5C5C5),
      );

  @override
  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
