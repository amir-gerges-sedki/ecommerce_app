import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/view/auth/controller/auth/onboarding_screen_controller.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_strings.dart';

import 'package:master_store/view/auth/screens/onboarding/widgets/dot_indicators.dart';

import 'package:master_store/view/auth/screens/onboarding/widgets/onboarding.dart';
import 'package:master_store/view/auth/screens/onboarding/widgets/onboarding_next.dart';
import 'package:master_store/view/auth/screens/onboarding/widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: onBoardingController.pageControler,
              onPageChanged: onBoardingController.updataPageIndicator,
              children: const [
                OnBoarding(
                  image: JsonAssets.loadingAnimation,
                  title: AppStrings.onBoardingTitle1,
                  subTitle: AppStrings.onBoardingDescription1,
                ),
                OnBoarding(
                  image: ImageAssets.onBoarding2,
                  title: AppStrings.onBoardingTitle2,
                  subTitle: AppStrings.onBoardingDescription2,
                ),
                OnBoarding(
                  image: ImageAssets.onBoarding3,
                  title: AppStrings.onBoardingTitle2,
                  subTitle: AppStrings.onBoardingDescription3,
                ),
              ]),
          const OnboardingSkip(),
          DotIndicator(
            pageControler: OnBoardingController.instance.pageControler,
            changeDotIndicator:
                OnBoardingController.instance.changeDotIndicator,
          ),
          const OnboardingNext()
        ],
      ),
    );
  }
}
