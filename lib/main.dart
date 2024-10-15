import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:master_store/binding/general_binding.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/localization/locale.dart';
import 'package:master_store/core/localization/localecontroller.dart';
import 'package:master_store/core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/firebase_options.dart';
import 'package:master_store/routes.dart';
import 'package:master_store/view/shop/screen/navAppbar/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
  Get.put(LocaleController());

  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await Firebase.initializeApp(
          name: 'fir-test-b43d4',
          options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp val) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      initialBinding: GeneralBinding(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: AppTheme.darkMode,
      home: const BottomNavBar(),
      getPages: routes,
    );
  }
}
