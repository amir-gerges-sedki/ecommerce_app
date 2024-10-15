import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class UpdateProfileInfo extends StatelessWidget {
  const UpdateProfileInfo(
      {super.key,
      required this.title,
      required this.titleInfo,
      required this.icon,
      required this.onTap});

  final String title;
  final String titleInfo;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems / 2),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: AppTextTheme.darkTextTheme.bodySmall,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                titleInfo,
                style: AppTextTheme.darkTextTheme.bodyMedium,
              ),
            ),
            Icon(
              icon,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
