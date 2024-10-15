import 'package:flutter/material.dart';

class BottomSheetTheme {
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(minHeight: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
