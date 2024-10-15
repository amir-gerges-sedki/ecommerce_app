import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/helper/helper.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size,
    required this.color,
    this.backgroundcolor,
    this.onPressed,
  });
  final IconData icon;
  final double? width, height, size;
  final Color? color;

  final Color? backgroundcolor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: backgroundcolor ??
                  (HelperFun.isDarkMode(context)
                      ? AppColor.dark
                      : AppColor.light),
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            icon,
            size: size,
            color: color,
          ),
        ));
  }
}
