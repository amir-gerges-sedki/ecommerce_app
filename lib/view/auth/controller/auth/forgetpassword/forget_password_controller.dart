import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/view/auth/screens/forgetpassword/reset_password_screen.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  //send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      //loading
      HelperFun.openLoadingDialog(
          'processing your request', JsonAssets.loadingAnimation);
      //Check Internet

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      // validation
      if (!forgetPasswordKey.currentState!.validate()) {
        HelperFun.stopLoader();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResentEmail(email.text.trim());

      // Remove loader
      HelperFun.stopLoader();
      HelperFun.successnackbar(
          'Email sent', 'Email Link sent to Reset your Pasword'.tr, 1);
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: ' oh snap');
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //loading
      HelperFun.openLoadingDialog(
          'processing your request', JsonAssets.loadingAnimation);
      //Check Internet

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance.sendPasswordResentEmail(email);

      // Remove loader
      HelperFun.stopLoader();
      HelperFun.successnackbar(
          'Email sent', 'Email Link sent to Reset your Pasword'.tr, 1);
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: ' oh snap');
    }
  }
}
