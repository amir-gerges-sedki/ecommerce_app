import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/animations/loader/animation_loader.dart';
import 'package:master_store/core/constant/app_colors.dart';

class HelperFun {
  // Show Dialog
  static Future<void> showDialogBox(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show Dialog
  static void openLoadingDialog(String title, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
            color: isDarkMode(Get.context!) ? AppColor.dark : AppColor.light,
            width: double.infinity,
            height: double.infinity,
            child: AnimationLoader(
              title: title,
              animation: animation,
            )),
      ),
    );
  }

  static stopLoader() {
    Navigator.of(Get.overlayContext!).pop();
  }

  // check dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Show Alert
  static void showAlert(BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Warning Snackbar
  static successnackbar(String title, String message, int duration) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColor.white,
      backgroundColor: AppColor.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check_outlined, color: AppColor.white),
    );
  }

  // success Snackbar
  static warningSnackbar({String title = '', required String message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColor.white,
      backgroundColor: AppColor.worning,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber_outlined),
    );
  }

  // Error Snackbar
  static errorSnackbar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColor.white,
      backgroundColor: AppColor.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber_outlined),
    );
  }

  // customToast
  static customToast({required massage}) {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // Truncate Text
  static String truncateText(String? text, int maxLength) {
    if (text == null) return '';
    return text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;
  }

  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [Colors.red, Colors.black, Colors.yellow, Colors.blue]);

  static getColor(String color) {
    if (color == 'red') {
      return Colors.red;
    } else if (color == 'green') {
      return Colors.green;
    } else if (color == 'black') {
      return Colors.black;
    } else if (color == 'white') {
      return Colors.white;
    } else if (color == 'yellow') {
      return Colors.yellow;
    } else if (color == 'brown') {
      return Colors.brown;
    } else if (color == 'purple') {
      return Colors.purple;
    } else if (color == 'mix') {
      return linearGradient.colors;
    } else {
      return null;
    }
  }
}
