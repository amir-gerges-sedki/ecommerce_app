import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius = AppSizes.cardRadiusLg,
    this.padding,
    this.backgroundColor,
    this.margin,
    this.borderColor = AppColor.borderPrimary,
    this.showBorder = false,
  });
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color? backgroundColor;
  final Color borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: backgroundColor ?? Colors.transparent,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
