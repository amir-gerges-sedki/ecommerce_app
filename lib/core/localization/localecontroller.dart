import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedpref.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedLang = myServices.sharedpref.getString("lang");

    if (sharedLang == "ar") {
      language = const Locale("ar");
    } else if (sharedLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
