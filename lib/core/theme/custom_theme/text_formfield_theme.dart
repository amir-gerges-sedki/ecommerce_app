import 'package:flutter/material.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class TextFormfieldTheme {
  static InputDecorationTheme darkTextFormfieldTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),

    hintStyle: AppTextTheme.darkTextTheme.bodyMedium,
    labelStyle: AppTextTheme.darkTextTheme.bodyMedium,
    floatingLabelStyle: AppTextTheme.darkTextTheme.bodySmall,

    // Enabled border
    enabledBorder: const OutlineInputBorder().copyWith(
        borderSide: const BorderSide(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(14)),

    // Focused border
    focusedBorder: const OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(14)),

    // Error border
    errorBorder: const OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(14)),
    // Focused error border
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderSide: const BorderSide(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(14)),
  );
}
