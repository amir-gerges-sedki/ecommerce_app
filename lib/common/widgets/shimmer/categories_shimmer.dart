import 'package:flutter/widgets.dart';
import 'package:master_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) => const Column(
                children: [
                  ShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  ShimmerEffect(width: 55, height: 8),
                ],
              ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: AppSizes.spaceBtwItems)),
    );
  }
}
