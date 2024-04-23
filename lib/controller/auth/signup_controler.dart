
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/auth_firebase_controller.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  // createAccountBasedPassword();
}

class SignUpControllerImp extends SignUpController {
  AuthController  authController = Get.put(AuthController());
  late  TextEditingController email;
  late  TextEditingController password;
  late  TextEditingController username;
  late  TextEditingController phone;
  GlobalKey<FormState>signupKey=GlobalKey<FormState>();
  bool? isshowpassword = true;
  bool? icontype = false;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    icontype = isshowpassword == true ? false : true;
    update();
  }
  @override
  goToLogin() {
   Get.offAllNamed(AppRoute.login);
  }

  @override
  signUp() {
    if(signupKey.currentState!.validate()){
      
     authController.createAccountBasedPassword(email.text, password.text);
    }
    }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

}