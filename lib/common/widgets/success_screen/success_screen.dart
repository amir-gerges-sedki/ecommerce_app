import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.onPressed,
      this.buttonTitle = AppStrings.tContinue});
  final String title, subTitle, image, buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: SpaceingStyle.paddingwithAppBarHeight * 2,
        child: Column(
          children: [
            //image

            Image(
                image: AssetImage(image),
                width: DeviceUtils.getScreenWidth() * 0.6),
            const SizedBox(height: AppSizes.spaceBtwSection),

            //Title & subTitle
            Text(title,
                style: AppTextTheme.darkTextTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(subTitle,
                style: AppTextTheme.darkTextTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwSection),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppTheme.darkMode.elevatedButtonTheme.style,
                onPressed: onPressed,
                child: Text(buttonTitle),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
