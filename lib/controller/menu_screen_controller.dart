import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class MenuScreenController extends GetxController {
  signOut();
}

class MenuScreenControllerImp extends MenuScreenController {
  @override
  signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoute.login);
  }
}
