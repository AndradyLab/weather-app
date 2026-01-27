import 'package:flutter/material.dart';
import 'package:weather_app/ui/core/themes/colors.dart';

abstract final class AppTheme {
  // static final _textTheme
  // static final _inputDecorationTheme
  //
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,

    // textTheme: _textTheme,
    // extensions: []
    // inputDecorationTheme: _inputDecorationTheme,
  );
  
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,

    // textTheme: _textTheme,
    // extensions: []
    // inputDecorationTheme: _inputDecorationTheme,
  );
  
  
}
