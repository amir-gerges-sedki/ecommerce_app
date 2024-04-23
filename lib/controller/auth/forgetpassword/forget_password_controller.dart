import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class ForgetPasswordController extends GetxController {
  checkPhone();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState>forgetpasswordKey=GlobalKey<FormState>();
  late  TextEditingController email;
  @override
  goToVerfiyCode() {
    if(forgetpasswordKey.currentState!.validate()) {
      Get.toNamed(AppRoute.verfiyCode);
    }
  }

  @override
  checkPhone() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
