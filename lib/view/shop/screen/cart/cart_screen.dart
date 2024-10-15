import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/cards/checkout.dart';
import 'package:master_store/common/widgets/cards/total_price.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/common/widgets/products/cart/items_cart.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
          title: Text(AppStrings.cart,
              style: AppTextTheme.darkTextTheme.headlineSmall),
          showBachArrow: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() =>
                TotalPrice(totalPrice: cartController.totalcartPrice.value)),
            Expanded(
              child: Checkout(
                onPressed: () => Get.toNamed(AppRoute.chechOutScreen),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          return cartController.cartItems.isEmpty
              ? const Text('data')
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.defaultSpace),
                    child: ItemsCart(),
                  ),
                );
        },
      ),
    );
  }
}
