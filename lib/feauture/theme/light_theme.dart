import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

final class LightTheme extends ITheme {
  @override
  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButton,
        cardTheme: cardTheme,
        appBarTheme: appBar,
        drawerTheme: drawer,
      );

  DrawerThemeData get drawer => DrawerThemeData(
        width: SizeType.teta.size,
        elevation: SizeType.hexa.size,
        shadowColor: colorScheme.shadow,
      );

  AppBarTheme get appBar => AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
          fontSize: SizeType.ennea.size,
        ),
      );

  CardTheme get cardTheme => CardTheme(
        color: colorScheme.tertiaryContainer,
        shadowColor: colorScheme.shadow,
        elevation: SizeType.hexa.size,
      );

  @override
  ColorScheme get colorScheme => const ColorScheme.light(
        primary: Color(0xFF81A739),
        primaryContainer: Color(0xFFB9D585), //Color.fromARGB(255, 69, 233, 74),
        onPrimary: Colors.black,
        onPrimaryContainer: Colors.black87,
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
          animationDuration: DurationConst.millisecond(300).duration,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
