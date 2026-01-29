import 'package:flutter/material.dart';
import 'package:weather_app/ui/core/themes/colors.dart';

abstract final class AppTheme {
  static final _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5, height: 1.2),
    headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
    labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
  );

  // static final _inputDecorationTheme

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    // extensions: []
    // inputDecorationTheme: _inputDecorationTheme,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    // extensions: []
    // inputDecorationTheme: _inputDecorationTheme,
  );
}
