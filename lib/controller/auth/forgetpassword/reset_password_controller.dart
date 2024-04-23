import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/routes_app.dart';



abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState>resetpasswordKey=GlobalKey<FormState>();
  late  TextEditingController password;
  late  TextEditingController repassword;
  @override
  goToSuccessPassword() {
    if(resetpasswordKey.currentState!.validate()) {
      Get.toNamed(AppRoute.successPassword);
    }
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
