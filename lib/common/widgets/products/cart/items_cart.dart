import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/common/widgets/products/cart/counter_cart.dart';
import 'package:master_store/common/widgets/products/cart/product_cart_info.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';
import 'package:master_store/view/shop/screen/home/widgets/round_image.dart';

class ItemsCart extends StatelessWidget {
  const ItemsCart({super.key, this.isShowaddremoveitem = true});
  final bool isShowaddremoveitem;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
          itemBuilder: (_, int index) {
            return Obx(
              () {
                final item = cartController.cartItems[index];
                return Row(
                  children: [
                    // Image
                    RoundImage(
                      isNetworkImage: true,
                      url: item.image ?? '',
                      width: 70,
                      height: 70,
                      padding: AppSizes.xs,
                      backgroundColor: HelperFun.isDarkMode(context)
                          ? AppColor.darkGrey.withOpacity(0.1)
                          : AppColor.light,
                    ),

                    const SizedBox(width: AppSizes.sm),
                    //price, ProductName, other details
                    ProductCartInfo(
                      cartItemModel: item,
                    ),

                    const Spacer(),
                    //increase and decrease item

                    isShowaddremoveitem
                        ? CounterProductCart(
                            price: item.price * item.quantity,
                            quantity: item.quantity,
                            add: () => cartController.addOneCart(item),
                            remove: () =>
                                cartController.removeOneFromCart(item),
                          )
                        : SizedBox(
                            child: Text('${item.price * item.quantity} egp'),
                          ),
                  ],
                );
              },
            );
          }),
    );
  }
}
