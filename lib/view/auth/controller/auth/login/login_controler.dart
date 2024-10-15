import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/view/personlization/controller/user_controller.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();

  final loginKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final isshowpassword = true.obs;
  final rememberMe = false.obs;
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('remember_me_email') ?? '';
    password.text = localStorage.read('remember_me_password') ?? '';
  }

// Signin with Email && Password
  Future<void> signWithEmailAndPassword() async {
    try {
      // loading
      HelperFun.openLoadingDialog('logging...', JsonAssets.loadingAnimation);

      //Check internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      //Form validation
      if (!loginKey.currentState!.validate()) {
        HelperFun.stopLoader();
        return;
      }

      //Remember Me
      if (rememberMe.value) {
        localStorage.write('remember_me_email', email.text.trim());
        localStorage.write('remember_me_password', password.text.trim());
      }

      //Login user
      await AuthenticationRepository.instance.loginUserWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      HelperFun.stopLoader();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: 'oh snap!', message: e.toString());
    }
  }

// Signin with Google

  Future<void> signWithGoogle() async {
    try {
      HelperFun.openLoadingDialog('logging...', JsonAssets.loadingAnimation);

      //Check internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      //Google Auth

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save info
      await userController.saveUserRecord(userCredentials);

      HelperFun.stopLoader();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: 'error', message: e);
    }
  }
}
