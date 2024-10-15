import 'package:flutter/material.dart';

class CirclulerContainer extends StatelessWidget {
  const CirclulerContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    required this.radius,
    required this.padding,
    this.background,
    this.margin = 10,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final double? margin;
  final Color? background;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: margin!),
      padding: EdgeInsets.only(top: padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: background,
      ),
      child: child,
    );
  }
}
