import 'package:flutter/material.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class CAppbarTheme {
  static final darkAppbarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: false,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: AppTextTheme.darkTextTheme.headlineSmall,
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
  );
}
