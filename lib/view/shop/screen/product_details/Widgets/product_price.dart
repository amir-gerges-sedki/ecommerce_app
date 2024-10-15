import 'package:flutter/material.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
      {super.key,
      required this.price,
      this.maxline = 1,
      this.isLage = false,
      this.lineThriugh = false});

  final String price;
  final int maxline;
  final bool isLage, lineThriugh;

  @override
  Widget build(BuildContext context) {
    return Text(price,
        maxLines: maxline,
        style: isLage
            ? AppTextTheme.darkTextTheme.titleLarge!.apply(
                decoration: lineThriugh ? TextDecoration.lineThrough : null)
            : AppTextTheme.darkTextTheme.labelMedium!.apply(
                decoration: lineThriugh ? TextDecoration.lineThrough : null));
  }
}
