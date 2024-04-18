import 'package:flutter/material.dart';
import 'package:theme/index.dart';

final class LightTheme extends BaseTheme {
  @override
  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButton,
        cardTheme: cardTheme,
        appBarTheme: appBar,
        drawerTheme: drawer,
        floatingActionButtonTheme: floatingActionButton,
        iconTheme: iconTheme,
        primaryIconTheme: iconPrimaryTheme,
      );

  IconThemeData get iconPrimaryTheme => IconThemeData(
        color: colorScheme.primary,
        size: 50,
      );

  IconThemeData get iconTheme => IconThemeData(
        color: colorScheme.onBackground,
        size: 50,
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
          color: colorScheme.onBackground,
          fontSize: 24,
        ),
      );

  CardTheme get cardTheme => CardTheme(
        color: colorScheme.tertiaryContainer,
        shadowColor: colorScheme.shadow,
        elevation: 16,
      );

  @override
  ColorScheme get colorScheme => const ColorScheme.light(
        primary: Color(0xFF81A739),
        primaryContainer: Color(0xFFB9D585), //Color.fromARGB(255, 69, 233, 74),
        onPrimary: Colors.black,
        onPrimaryContainer: Colors.white,
        // --------------------------------
        secondary: Color(0xFFCF0A0A),
        secondaryContainer: Color(0xFFDC5F00),
        onSecondary: Colors.white70,
        onSecondaryContainer: Colors.white,
        // --------------------------------
        tertiary: Color(0xFFFFF78A),
        tertiaryContainer: Color(0xFFFFE382),
        onTertiary: Colors.black87,
        onTertiaryContainer: Colors.white,
        // --------------------------------
        background: Colors.white,
        onBackground: Colors.black,
        // --------------------------------
        error: Color(0xFFCF0A0A),
        errorContainer: Color(0xFFDC5F00),
        onError: Colors.white,
        onErrorContainer: Colors.white,
        // --------------------------------
        surfaceTint: Colors.blueGrey,
        //
        shadow: Color(0xFFC5C5C5),
      );

  @override
  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          side: BorderSide(
            color: colorScheme.onBackground,
            style: BorderStyle.solid,
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  FloatingActionButtonThemeData get floatingActionButton =>
      FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        splashColor: colorScheme.onPrimary,
        elevation: 16,
      );
}
