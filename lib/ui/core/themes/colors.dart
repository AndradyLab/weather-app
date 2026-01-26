import 'package:flutter/material.dart';

abstract final class AppColors {
  static const black1 = Color(0xFF1a1a16);
  static const white1 = Color(0xFFFAFAFA);
  static const elevatedButtonOrange1 = Color(0xFFd98f1e);
  

  static final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black1,
    secondary: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white70,
    onSecondary: AppColors.black1,
    onSurface: AppColors.black1,
    error: Colors.red,
    onError: Colors.white30
  );
  
  static final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white1,
    secondary: Colors.grey,
    surface: Colors.black38,
    onPrimary: Colors.black38,
    onSecondary: AppColors.white1,
    onSurface: AppColors.white1,
    error: Colors.red,
    onError: Colors.white30
  );
  
  
}
