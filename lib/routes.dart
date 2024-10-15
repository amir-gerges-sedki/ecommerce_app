import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/view/auth/screens/signup/verfiy_email_screen.dart';
import 'package:master_store/view/personlization/screens/address/add_new_address_screen.dart';
import 'package:master_store/view/personlization/screens/address/addresses_screen.dart';
import 'package:master_store/view/personlization/screens/profile/profile_screen.dart';
import 'package:master_store/view/personlization/screens/setting/setting_screen.dart';
import 'package:master_store/view/shop/screen/cart/cart_screen.dart';
import 'package:master_store/view/shop/screen/checkout/chechout_screen.dart';
import 'package:master_store/view/auth/screens/forgetpassword/forget_passwoed_screen.dart';
import 'package:master_store/view/auth/screens/login/login_screen.dart';
import 'package:master_store/view/auth/screens/signup/sign_up_screen.dart';
import 'package:master_store/view/shop/screen/navAppbar/bottom_nav_bar.dart';
import 'package:master_store/view/shop/screen/home/home_screen.dart';
import 'package:master_store/view/auth/screens/onboarding/onboarding_screen.dart';
import 'package:master_store/view/shop/screen/store/shop_screen.dart';
import 'package:master_store/view/shop/screen/wishlist/wishlist_screen.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(
      name: AppRoute.onBoardingScreen, page: (() => const OnBoardingScreen())),
  GetPage(name: AppRoute.login, page: (() => const Login())),
  GetPage(name: AppRoute.signup, page: (() => const Signup())),

  GetPage(name: AppRoute.forgetPassword, page: (() => const ForgetPassword())),

  GetPage(
      name: AppRoute.verfiyEmailScreen,
      page: (() => const VerfiyEmailScreen())),
// shop
  GetPage(name: AppRoute.bottomNavBar, page: (() => const BottomNavBar())),
  GetPage(name: AppRoute.homeScreen, page: (() => const HomeScreen())),

  GetPage(name: AppRoute.store, page: (() => const Store())),
  // GetPage(
  //     name: AppRoute.productDetailsScreen,
  //     page: (() => const ProductDetailsScreen(

  //         ))),
  GetPage(name: AppRoute.wishList, page: (() => const WishlistScreen())),
  GetPage(name: AppRoute.cart, page: (() => const CartScreen())),
  GetPage(name: AppRoute.chechOutScreen, page: (() => const ChechOutScreen())),
  GetPage(name: AppRoute.setting, page: (() => const SettingScreen())),
  GetPage(name: AppRoute.profile, page: (() => const ProfileScreen())),
  GetPage(name: AppRoute.addresses, page: (() => const AddressesScreen())),
  GetPage(
      name: AppRoute.addNewAddresses,
      page: (() => const AddNewAddressScreen())),
  // GetPage(name: AppRoute.addCategory, page: (() => const AddCategory())),
  // GetPage(name: AppRoute.updateCategory, page: (() => const EditCategory())),
];
