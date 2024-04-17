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
  ColorScheme get colorScheme => const ColorScheme.light(
        primary: Colors.blue,
        primaryContainer: Colors.deepPurple, //Color.fromARGB(255, 69, 233, 74),
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
        surface: Colors.white,
        onSurface: Colors.black,
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
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

/**  @override
  ColorScheme get colorScheme => const ColorScheme.light(
  primary: Colors.cyan,
  onPrimaryContainer: Colors.cyanAccent, // Varsayılan olarak primary ile birbirine yakın bir ton tercih edilebilir
  onPrimary: Colors.black,
  secondary: Color(0xFFCF0A0A),
  onSecondaryContainer: Color(0xFFDC5F00),
  onSecondary: Colors.white70,
  background: Colors.white,
  surface: Colors.white,
  onBackground: Colors.black87,
  onSurface: Colors.black87,
  error: Color(0xFFCF0A0A),
  onError: Colors.white,
); */