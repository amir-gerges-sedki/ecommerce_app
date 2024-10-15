import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColor.white,
            )),
        Positioned(
            right: 0,
            top: 6,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(
                  child: Obx(() => Text(
                      controller.numberOfCartItem.value.toString(),
                      style: AppTextTheme.darkTextTheme.labelLarge))),
            )),
      ],
    );
  }
}
