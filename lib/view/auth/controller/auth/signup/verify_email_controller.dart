import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/success_screen/success_screen.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';

class VerifyEmail extends GetxController {
  static VerifyEmail get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerAuthForAtuoRedirect();
  }

  // send email

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      HelperFun.successnackbar('email sent', 'Please, Check you email!!', 2);
    } catch (e) {
      HelperFun.errorSnackbar(title: 'error');
    }
  }

  //Check email verified or not

  checkEmailVerified() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(SuccessScreen(
          title: 'Congratuation',
          subTitle: 'Your acccount created',
          image: ImageAssets.appLogo,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }

  //Timer

  setTimerAuthForAtuoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseAuth.instance.currentUser?.reload();
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(SuccessScreen(
            title: 'Congratuation',
            subTitle: 'Your acccount created',
            image: JsonAssets.loadingAnimation,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }
}
