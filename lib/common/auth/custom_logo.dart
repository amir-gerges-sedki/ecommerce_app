import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/logo.png',
            width: 60, height: 60, color: AppColor.primary),
        const SizedBox(height: AppSizes.md),
        Text(
          title,
          style: AppTextTheme.darkTextTheme.headlineMedium,
        ),
      ],
    );
  }
}
