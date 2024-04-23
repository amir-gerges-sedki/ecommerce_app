import 'package:get/get.dart';
import 'package:master_store/controller/auth/auth_firebase_controller.dart';

abstract class SuccesSignupController extends GetxController {
  goToHomeScreen();
}

class SuccesSignupControllerImp extends SuccesSignupController {
  AuthController authController = Get.put(AuthController());
  @override
  goToHomeScreen() {
    authController.verifiedEmail();
  }
}
