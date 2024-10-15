import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/view/personlization/screens/setting/setting_screen.dart';
import 'package:master_store/view/shop/screen/home/home_screen.dart';
import 'package:master_store/view/shop/screen/orders/orders_screen.dart';
import 'package:master_store/view/shop/screen/store/shop_screen.dart';
import 'package:master_store/view/shop/screen/wishlist/wishlist_screen.dart';

abstract class BottomNavBarController extends GetxController {
  changePage(int currentPage);
}

class BottomNavBarControllerImp extends BottomNavBarController {
  int currentpage = 2;

  List<Widget> listPage = [
    const Store(),
    const WishlistScreen(),
    const HomeScreen(),
    const OrdersScreen(),
    const SettingScreen(),
  ];
  // List titleButtom = ['HomeScreen', 'Shop', 'cart', 'menu'];
  List<Widget> iconButtom = const [
    Icon(Icons.store_outlined),
    Icon(Icons.favorite_outline),
    Icon(Icons.home_outlined),
    Icon(Icons.shopping_bag_outlined),
    Icon(Icons.person_2_outlined),
  ];

  @override
  changePage(int currentPage) {
    currentpage = currentPage;
    update();
  }
}
