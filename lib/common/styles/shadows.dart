import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: AppColor.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: AppColor.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
