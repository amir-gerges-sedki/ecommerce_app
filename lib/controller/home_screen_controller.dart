import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/view/screens/cart_screen.dart';
import 'package:master_store/view/screens/category_screen.dart';
import 'package:master_store/view/screens/menu_screen.dart';
import 'package:master_store/view/screens/shop_screen.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = const [
    CategoryScreen(),
    Shop(),
    Cart(),
    Menu(),
  ];
  List titleButtom = ['Home', 'Shop', 'cart', 'menu'];
  List iconButtom = const [
    Icons.home,
    Icons.shop,
    Icons.shopping_cart,
    Icons.menu,
  ];
  @override
  changePage(int currentPage) {
    currentpage = currentPage;
    update();
  }
}
