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
  ColorScheme get colorScheme => ColorScheme.dark(
        primary: Colors.blue,
        primaryContainer: Colors.blue[400],
        onPrimary: Colors.black87,
        onPrimaryContainer: Colors.black54,
        //---------------------------------
        secondary: Colors.blueGrey.shade300,
        secondaryContainer: Colors.blueGrey.shade400,
        onSecondary: Colors.white70,
        onSecondaryContainer: Colors.white,
        //---------------------------------
        tertiary: Colors.white70,
        tertiaryContainer: Colors.blueGrey.shade900,
        onTertiary: Colors.black87,
        onTertiaryContainer: Colors.black54,
        //---------------------------------
        error: Colors.red.shade900,
        errorContainer: Colors.red,
        onError: Colors.white,
        onErrorContainer: Colors.white,
        //---------------------------------
        surface: Colors.black87,
        onSurface: Colors.white,

        //---------------------------------

        surfaceTint: Colors.blueGrey,
        //
        shadow: Colors.white70,
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
