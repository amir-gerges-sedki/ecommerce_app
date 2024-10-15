import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/view/auth/controller/auth/onboarding_screen_controller.dart';
import 'package:master_store/core/device/device_utiles.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
          onPressed: OnBoardingController.instance.skipOnBoarding,
          child: const Text(AppStrings.skip,
              style: TextStyle(color: AppColor.darkGrey))),
    );
  }
}
