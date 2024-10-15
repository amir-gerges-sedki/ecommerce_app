import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.pageControler,
    required this.changeDotIndicator,
  });
  final PageController pageControler;
  final void Function(int) changeDotIndicator;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: const ExpandingDotsEffect(
          dotHeight: 6,
        ),
        controller: pageControler,
        onDotClicked: changeDotIndicator,
        count: 3,
      ),
    );
  }
}
