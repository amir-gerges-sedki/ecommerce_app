import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/laylouts/grid_layouts.dart';
import 'package:master_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, required this.itemCount});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayouts(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                children: [
                  ShimmerEffect(width: 180, height: 100),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  ShimmerEffect(width: 160, height: 15),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  ShimmerEffect(width: 110, height: 15)
                ],
              ),
            ));
  }
}
