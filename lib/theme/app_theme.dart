import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color primaryColor = Color(0xFF11bbb3);
  static const Color background = Color(0xFFf3f4f6);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color subtitleColor = Color(0xFF6c7280);
  static const Color cardTitleColor = Color(0xFF4b5563);
  static const Color textColor = Color(0xFF888d98);

  static final lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: background,
    cardColor: whiteColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      iconTheme: IconThemeData(
        color: textColor,
      ),
    ),
    primaryColor: primaryColor,
    // button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor, backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    useMaterial3: true,
  );
}
