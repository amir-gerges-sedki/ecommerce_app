import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/auth_firebase_controller.dart';
import 'package:master_store/core/localization/locale.dart';
import 'package:master_store/core/localization/localecontroller.dart';
import 'package:master_store/core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:master_store/routes.dart';
import 'package:master_store/view/screens/auth/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Firebase.initializeApp(
    name: 'fir-test-b43d4',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    AuthController controllerr = Get.put(AuthController());
    return GetMaterialApp(
      translations: MyTranslation(),
      onInit: controllerr.initAuth(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Master Store',
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyMedium: TextStyle(
              height: 2,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? "/loginscreen"
      //     : "/homescreen",
      home: const Login(),
      getPages: routes,
    );
  }
}
