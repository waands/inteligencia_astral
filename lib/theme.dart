import 'package:flutter/material.dart';
import '/colors.dart';

class AppTheme {
  static const colors = AppColors();
  static const TextStyle defaultTextStyle = TextStyle(
    fontFamily: 'Inter',
  );

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 165, 225, 208),
    );
  }
}