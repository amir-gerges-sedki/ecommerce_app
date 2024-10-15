import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[800]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[600]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? AppColor.darkerGrey : AppColor.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ));
  }
}
