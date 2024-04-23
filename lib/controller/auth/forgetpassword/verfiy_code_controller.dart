import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class VerfiyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerfiyCodeControllerImp extends VerfiyCodeController {

  late  TextEditingController email;
  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }


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
  
  @override
  checkCode() {
 
  }
}
