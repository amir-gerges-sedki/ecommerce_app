import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/view/auth/controller/auth/onboarding_screen_controller.dart';
import 'package:master_store/core/device/device_utiles.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: DeviceUtils.getBottomNavigationBarHeight(),
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: const Icon(Icons.chevron_right)));
  }
}
