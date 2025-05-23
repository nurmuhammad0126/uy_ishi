import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';
import '../constants/app_theme.dart';

extension BuildContextExtension on BuildContext {
  AppColors get colors => AppColors();
  ThemeData get appTheme => AppThemes.lightTheme;
  AppTextStyle get styles => appTheme.extension<AppTextStyle>()!;
}
