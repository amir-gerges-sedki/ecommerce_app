import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.image,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.width = 65,
    this.height = 65,
    this.padding = AppSizes.sm,
    this.child,
  });
  final String image;
  final double width;
  final double height;
  final double padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(800),
      child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, ownloadProgress) =>
                      const ShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : SizedBox(
                  child: child,
                )),
    );
  }
}
