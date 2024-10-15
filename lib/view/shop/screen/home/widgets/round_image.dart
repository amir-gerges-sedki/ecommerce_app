import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    super.key,
    this.onTap,
    this.isNetworkImage = false,
    this.fit = BoxFit.contain,
    required this.url,
    this.width,
    this.height,
    this.border,
    this.padding = 10,
    this.backgroundColor,
    this.applyImageRadius = true,
    this.borderRadius = AppSizes.md,
  });
  final VoidCallback? onTap;
  final bool isNetworkImage;
  final bool applyImageRadius;
  final BoxFit? fit;
  final String url;
  final double? width, height;
  final double padding;
  final double borderRadius;
  final Color? backgroundColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(url)
                : AssetImage(url) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
