import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:master_store/controller/auth/auth_firebase_controller.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class LoginController extends GetxController {
  login();
  loginWithGoogle();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  AuthController authController = Get.put(AuthController());
  GoogleSignIn? googleSignIn = GoogleSignIn(scopes: ['email']);
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool? isshowpassword = true;
  bool? icontype = false;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    icontype = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  login() {
    // if (loginKey.currentState!.validate()) {
    authController.signInUser(email.text, password.text);
    //}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  Future loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offNamed(AppRoute.homeScreen);
  }
}
