import 'package:get/get.dart';

abstract class SuccesSignupController extends GetxController {
  goToHomeScreen();
}

class SuccesSignupControllerImp extends SuccesSignupController {
  // AuthController authController = Get.put(AuthController());
  @override
  goToHomeScreen() {
    // authController.verifiedEmail();
  }
}
