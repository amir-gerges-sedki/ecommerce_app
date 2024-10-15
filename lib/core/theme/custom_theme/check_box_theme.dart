import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';

class CCheckboxTheme {
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.white;
      } else {
        return Colors.transparent;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
