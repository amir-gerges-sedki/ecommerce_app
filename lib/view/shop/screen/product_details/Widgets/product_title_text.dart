import 'package:flutter/material.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText(
      {super.key,
      required this.title,
      this.maxLine = 2,
      this.smallSize = false,
      this.textAlign = TextAlign.left});
  final String title;
  final int maxLine;
  final bool smallSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: smallSize
            ? AppTextTheme.darkTextTheme.labelLarge
            : AppTextTheme.darkTextTheme.titleSmall);
  }
}
