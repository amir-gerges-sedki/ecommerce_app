import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/data/repositories/user/user_repo.dart';
import 'package:master_store/view/auth/model/user_model.dart';
import 'package:master_store/view/auth/screens/signup/verfiy_email_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final image = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phone = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  final isshowpassword = true.obs;
  final privacyPolicy = false.obs;

  void signup() async {
    try {
      // loading
      HelperFun.openLoadingDialog(
          'We are processing your information...', JsonAssets.loadingAnimation);

      //Check internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      //Form validation
      if (!signupKey.currentState!.validate()) {
        HelperFun.stopLoader();
        return;
      }

      //Check privacy policy
      if (!privacyPolicy.value) {
        HelperFun.warningSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'Required to create account,you must read and accept Privacy Policy and term to use');
        HelperFun.stopLoader();
        return;
      }

      //Register user
      final userCredential = await AuthenticationRepository.instance
          .registerUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          email: email.text.trim(),
          phone: phone.text.trim(),
          userName: userName.text.trim(),
          id: userCredential!.user!.uid,
          image: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // HelperFun.stopLoader();

      HelperFun.successnackbar('Congratulations',
          'Your account has been created! Verify email to continue.', 3);
      Get.to(() => VerfiyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: 'oh snap!', message: e.toString());
    }
  }
}
