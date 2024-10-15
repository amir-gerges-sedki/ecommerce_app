import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';

import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class TextBody extends StatelessWidget {
  const TextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppStrings.forgotPasswordTitle,
        style: AppTextTheme.darkTextTheme.headlineMedium,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: AppSizes.spaceBtwItems),
      Text(AppStrings.forgotPasswordDescription,
          style: AppTextTheme.darkTextTheme.bodySmall,
          textAlign: TextAlign.start),
    ]);
  }
}
