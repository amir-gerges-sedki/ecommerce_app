import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/data/repositories/user/user_repo.dart';
import 'package:master_store/view/personlization/controller/user_controller.dart';
import 'package:master_store/view/personlization/screens/profile/profile_screen.dart';

class UpdateController extends GetxController {
  static UpdateController get instance => Get.find();

  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumer = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserInfoKey = GlobalKey<FormState>();

  // init userName
  @override
  void onInit() {
    initializeInfo();
    super.onInit();
  }

// Fetch user Record

  Future<void> initializeInfo() async {
    userName.text = userController.user.value.userName;
    email.text = userController.user.value.email;
    phoneNumer.text = userController.user.value.phone;
  }

  Future<void> updateUserInfo() async {
    try {
      HelperFun.openLoadingDialog(
          'Updated your information', JsonAssets.loadingAnimation);

      //Check internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HelperFun.stopLoader();
        return;
      }

      //Form validation
      if (!updateUserInfoKey.currentState!.validate()) {
        HelperFun.stopLoader();
        return;
      }

      //update userName in firebase

      Map<String, dynamic> userInfo = {
        'userName': userName.text.trim(),
        'phone': phoneNumer.text.trim(),
        'email': email.text.trim()
      };
      await userRepository.updateSingleField(userInfo);

      userController.user.value.userName = userName.text.trim();
      userController.user.value.email = email.text.trim();
      userController.user.value.phone = phoneNumer.text.trim();

      HelperFun.stopLoader();

      HelperFun.successnackbar(
          'Congratuations', 'Your info has been updated. ', 1);

      Get.off(() => const ProfileScreen());
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.errorSnackbar(title: 'Oh span', message: e.toString());
    }
  }
}
