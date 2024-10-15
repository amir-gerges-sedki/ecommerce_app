import 'package:flutter/material.dart';
import 'package:master_store/core/theme/app_theme.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.maxLine,
    this.textAlign = TextAlign.start,
    required this.textSmall,
  });
  final String title;
  final int? maxLine;
  final TextAlign? textAlign;
  final bool textSmall;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: textSmall
            ? AppTheme.darkMode.textTheme.titleSmall
            : AppTheme.darkMode.textTheme.titleLarge,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        textAlign: textAlign);
  }
}
