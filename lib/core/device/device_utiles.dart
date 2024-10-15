import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DeviceUtils {
  // Hide the keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Change the system bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, // Set status bar color
        systemNavigationBarColor: color // Set navigation bar color
        ));
  }

  // Check if the device is in landscape mode
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  // Check if the device is in portrait mode
  static bool isPartraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // Set full screen mode
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // Get device screen width
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // Get device screen height
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Check if dark mode is enabled
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  // Get status bar height
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  // Get bottom navigation bar height
  static double getBottomNavigationBarHeight() {
    // return MediaQuery.of(Get.context!).padding.bottom;
    return kBottomNavigationBarHeight;
  }

  // Get App bar height
  static double getAppBarHeight() {
    // return MediaQuery.of(Get.context!).padding.bottom;
    return kToolbarHeight;
  }

  // Get device pixel ratio
  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // Get keyboard height
  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  // Check if keyboard is visible
  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewIsets = View.of(context).viewInsets;
    return viewIsets.bottom > 0;
  }

  // Check if the app is running on a physical device
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void shwoStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // Check if the app is running on Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Check if the app is running on iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  // // Check if the device has an internet connection
  // static Future<bool> hasInternetConnection() async {
  //   try {
  //     final connectivityResult = await InternetAddress.lookup('example.com');
  //     return connectivityResult.isNotEmpty &&
  //         connectivityResult[0].rawAddress.isNotEmpty;
  //   } on SocketException catch (_) {
  //     return false;
  //   }
  // }
}
