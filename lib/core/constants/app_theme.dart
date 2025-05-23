import 'package:ecommer_app_market/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    extensions: [AppTextStyle.defaultStyle],
    scaffoldBackgroundColor: Color(0xFFE9F4F9),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFFE9F4F9)),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFFE9F4F9)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFE9F4F9),
    ),
  );
}
