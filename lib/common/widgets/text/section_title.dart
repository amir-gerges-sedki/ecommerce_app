import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.title,
      this.onpressed,
      this.textColor,
      this.buttonTitle = 'veiw all',
      this.showButton = true});
  final String title;
  final void Function()? onpressed;
  final bool showButton;
  final Color? textColor;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.darkTextTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showButton)
            TextButton(onPressed: onpressed, child: Text(buttonTitle))
        ],
      ),
    );
  }
}
