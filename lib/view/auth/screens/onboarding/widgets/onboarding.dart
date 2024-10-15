import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/device/device_utiles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        children: [
          Lottie.asset(image,
              height: DeviceUtils.getScreenWidth() * 0.8,
              width: DeviceUtils.getScreenWidth() * 0.8),
          Text(title,
              style: AppTheme.darkMode.textTheme.displayLarge,
              textAlign: TextAlign.center),
          Text(subTitle,
              style: AppTheme.darkMode.textTheme.displaySmall,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
