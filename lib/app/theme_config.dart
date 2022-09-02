import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _textColor = Color(0xFF3C4043);

final themeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Color(0xFF5F6267)),
  colorScheme: const ColorScheme.light(secondary: _textColor),
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 36,
      color: _textColor,
    ),
    headline2: TextStyle(
      letterSpacing: 5,
      fontWeight: FontWeight.w900,
      color: _textColor,
      fontSize: 20,
    ),
    headline3: TextStyle(
      letterSpacing: 5,
      fontWeight: FontWeight.w200,
      color: _textColor,
      fontSize: 14,
    ),
    subtitle1: TextStyle(color: _textColor),
    subtitle2: TextStyle(color: Color(0xFF5F6267)),
    bodyText2: TextStyle(color: _textColor),
    caption: TextStyle(color: Color(0xFF5F6267)),
    headline5: TextStyle(color: _textColor),
  ),
  primaryTextTheme: const TextTheme(
    titleSmall: TextStyle(color: _textColor),
    titleMedium: TextStyle(color: _textColor),
    titleLarge: TextStyle(color: _textColor),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      statusBarColor: Color(0xFFFFFFFF),
    ),
  ),
);
