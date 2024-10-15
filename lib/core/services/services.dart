import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpref;
  static const String _themeMode = 'themeMode';
  Future<MyServices> init() async {
    sharedpref = await SharedPreferences.getInstance();
    return this;
  }

  int? get getTheme {
    return sharedpref.getInt(_themeMode);
  }

  Future<void> setThemeMode(int value) async {
    sharedpref.setInt(_themeMode, value);
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}
