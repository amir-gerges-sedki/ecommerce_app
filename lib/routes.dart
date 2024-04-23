import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:master_store/core/constant/routes_app.dart';
import 'package:master_store/view/admin_app/add_category_screen.dart';
import 'package:master_store/view/admin_app/update_category_screen.dart';
import 'package:master_store/view/screens/auth/check.dart';
import 'package:master_store/view/screens/auth/forgetpassword/forget_passwoed_screen.dart';
import 'package:master_store/view/screens/auth/forgetpassword/reset_password_screen.dart';
import 'package:master_store/view/screens/auth/forgetpassword/success_pasword_screen.dart';
import 'package:master_store/view/screens/auth/forgetpassword/verfiycode_screen.dart';
import 'package:master_store/view/screens/auth/login_screen.dart';
import 'package:master_store/view/screens/auth/sign_up_screen.dart';
import 'package:master_store/view/screens/auth/success_signup_screen.dart';
import 'package:master_store/view/screens/cart_screen.dart';
import 'package:master_store/view/screens/home_screen.dart';
import 'package:master_store/view/admin_app/homepage_admin.dart';
import 'package:master_store/view/screens/menu_screen.dart';
import 'package:master_store/view/screens/shop_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.login, page: (() => const Login())),
  GetPage(name: AppRoute.check, page: (() => const Check())),
  GetPage(name: AppRoute.signup, page: (() => const Signup())),
  GetPage(name: AppRoute.successSignup, page: (() => const SuccessSignup())),
  GetPage(
      name: AppRoute.successPassword, page: (() => const SuccessPassword())),
  GetPage(name: AppRoute.forgetPassword, page: (() => const ForgetPassword())),
  GetPage(name: AppRoute.verfiyCode, page: (() => const VerfiyCode())),
  GetPage(name: AppRoute.homePage, page: (() => const HomePage())),
  GetPage(name: AppRoute.resetPassword, page: (() => const ResetPassword())),
  GetPage(name: AppRoute.homeScreen, page: (() => const HomeScreen())),
  GetPage(name: AppRoute.shop, page: (() => const Shop())),
  GetPage(name: AppRoute.shop, page: (() => const Cart())),
  GetPage(name: AppRoute.menu, page: (() => const Menu())),
  GetPage(name: AppRoute.addCategory, page: (() => const AddCategory())),
  GetPage(name: AppRoute.updateCategory, page: (() => const UpdateCategory())),
];
