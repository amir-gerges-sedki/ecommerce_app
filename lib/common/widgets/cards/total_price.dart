import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.totalPrice,
  });

  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 54,
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      padding: const EdgeInsets.symmetric(
          vertical: AppSizes.sm, horizontal: AppSizes.sm),
      decoration: BoxDecoration(
          color: AppColor.secondry.withOpacity(0.8),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppSizes.borderRadiusLg))),
      child: Center(child: Text('Total:  $totalPrice Egp')),
    ));
  }
}
