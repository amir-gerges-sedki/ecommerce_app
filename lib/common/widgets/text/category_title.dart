import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/app_theme.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
    required this.title,
    this.iconColor = AppColor.primary,
    this.textColor = AppColor.white,
    this.textAlign,
  });
  final String title;
  final Color iconColor, textColor;
  final int maxLine = 1;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          maxLines: maxLine,
          title,
          textAlign: textAlign,
          style: AppTheme.darkMode.textTheme.labelMedium,
        ),
        const SizedBox(width: AppSizes.xs - 3),
        Icon(
          Icons.verified,
          color: iconColor,
          size: AppSizes.iconSm,
        )
      ],
    );
  }
}
