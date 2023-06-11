import 'package:flutter/material.dart';

abstract class ColorConstant {
  static const Color darkBlue = Color(0xff201a30);
  static const Color lightGreen = Color(0xff0df5e3);
  static const Color darkBlueWithWhiteShade = Color(0xff38304c);
}

class AppTheme {
  static ColorScheme lightColorScheme = const ColorScheme.light();
  static ColorScheme darkColorScheme = const ColorScheme.dark(
    primary: ColorConstant.darkBlue,
    secondary: ColorConstant.lightGreen,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    primaryColor: ColorConstant.darkBlue,
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: ColorConstant.darkBlue,
    elevatedButtonTheme: _elevatedButtonThemeData,
    textButtonTheme: _textButtonThemeData,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConstant.lightGreen,
      ),
    ),
  );
  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorConstant.lightGreen,
      ),
    ),
  );
}
