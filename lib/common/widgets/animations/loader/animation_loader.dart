import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader(
      {super.key,
      required this.title,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  final String title, animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Lottie.asset(
                // // height: 100,
                // width: DeviceUtils.getScreenWidth() * 0.3,
                animation,
              ),
            ),
            const SizedBox(height: AppSizes.defaultSpace),
            Text(
              title,
              style: AppTextTheme.darkTextTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.defaultSpace),
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: AppColor.dark),
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style: AppTextTheme.darkTextTheme.bodyMedium!
                            .apply(color: AppColor.light),
                      ),
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
