import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/services/services.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/core/theme/custom_theme/appbar_theme.dart';
import 'package:master_store/core/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:master_store/core/theme/custom_theme/check_box_theme.dart';
import 'package:master_store/core/theme/custom_theme/chip_theme.dart';
import 'package:master_store/core/theme/custom_theme/elevated_button_theme.dart';
import 'package:master_store/core/theme/custom_theme/outlined_button_theme.dart';
import 'package:master_store/core/theme/custom_theme/text_formfield_theme.dart';

class AppTheme {
  MyServices myServices = Get.find();
  // final SharedPrefManager _sharedPrefs;y
  AppTheme(this.myServices);
  // bool get isDarkMode {
  //   bool? isDarkMode = _sharedPrefs.isDarkMode;
  //   isDarkMode ??=
  //       SchedulerBinding.instance.platformDispatcher.platformBrightness ==
  //           Brightness.dark;
  //   return isDarkMode;
  // }

  int get themeMode {
    int? mode = myServices.getTheme;
    if (mode == null) {
      if (SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark) {
        mode = 2;
      } else {
        mode = 0;
      }
      myServices.setThemeMode(mode);
    }
    return mode;
  }

  ThemeData cycleThroughTheme() {
    int nextMode = themeMode == 2 ? 0 : themeMode + 1;
    myServices.setThemeMode(nextMode);
    return getApplicationTheme(mode: nextMode);
  }

  ThemeData switchCurrentTheme({required int mode}) {
    myServices.setThemeMode(mode);
    return getApplicationTheme(mode: mode);
  }

  ThemeData getApplicationTheme({int? mode}) {
    mode = mode ?? themeMode;

    switch (mode) {
      case 0:
        return darkMode;
      case 1:
        return darkMode;
      case 2:
        return darkMode;
      default:
        return darkMode;
    }
  }

  static final ThemeData darkMode = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.dark,
    primaryColor: AppColor.primary,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: ChipAppTheme.darkChipTheme,
    appBarTheme: CAppbarTheme.darkAppbarTheme,
    elevatedButtonTheme: CElevatedButtonThemes.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TextFormfieldTheme.darkTextFormfieldTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CCheckboxTheme.darkCheckBoxTheme,
  );
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color complementaryColor;
  final Color? splashPatternBackgroundColor;

  const CustomThemeExtension({
    required this.complementaryColor,
    required this.splashPatternBackgroundColor,
  });

  @override
  CustomThemeExtension copyWith({
    Color? complementaryColor,
    Color? splashPatternBackgroundColor,
  }) {
    return CustomThemeExtension(
      complementaryColor: complementaryColor ?? this.complementaryColor,
      splashPatternBackgroundColor:
          splashPatternBackgroundColor ?? this.splashPatternBackgroundColor,
    );
  }

  @override
  CustomThemeExtension lerp(covariant CustomThemeExtension? other, double t) {
    return this;
  }
}
