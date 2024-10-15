import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class CElevatedButtonThemes {
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: AppColor.white,
    backgroundColor: AppColor.primary,
    disabledForegroundColor: AppColor.darkGrey,
    disabledBackgroundColor: AppColor.darkGrey,
    // side: const BorderSide(color: AppColor.darkGrey),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: AppTextTheme.darkTextTheme.titleLarge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
