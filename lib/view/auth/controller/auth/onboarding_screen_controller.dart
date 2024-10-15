import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:master_store/core/constant/app_routes.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final pageControler = PageController();
  Rx<int> currentPage = 0.obs;

  void updataPageIndicator(index) => currentPage.value = index;

  void changeDotIndicator(index) {
    currentPage.value = index;
    pageControler.jumpTo(index);
  }

  void skipOnBoarding() {
    final storage = GetStorage();
    storage.write('firstTime', false);
    Get.offAllNamed(AppRoute.login);
  }

  void nextPage() {
    if (currentPage.value == 2) {
      final storage = GetStorage();
      storage.write('firstTime', false);
      Get.offAllNamed(AppRoute.login);
    } else {
      int nextPage = currentPage.value + 1;
      pageControler.jumpToPage(nextPage);
    }
  }
}
