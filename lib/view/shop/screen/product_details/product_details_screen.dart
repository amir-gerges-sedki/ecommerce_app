import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/cards/checkout.dart';
import 'package:master_store/common/widgets/cards/total_price.dart';
import 'package:master_store/common/widgets/products/choice%20chip/choice_chip.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';
import 'package:master_store/view/shop/controller/products/variation_controller.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';
import 'package:master_store/view/shop/screen/product_details/Widgets/discount_share.dart';
import 'package:master_store/view/shop/screen/product_details/Widgets/product_image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.liquid});

  final LiquidProductModel liquid;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());

    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProduct(liquid);
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() =>
              TotalPrice(totalPrice: cartController.totalcartPrice.value)),
          Expanded(
            child: Checkout(
              onPressed: () => Get.toNamed(AppRoute.chechOutScreen),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image slider
            ProductImageSlider(liquid: liquid),

            //product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  //Discount, sale Tag and Sharing

                  DiscountAndShare(
                    liquid: liquid,
                  ),

                  //price and saleing price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: liquid.productAttribute!
                            .map(
                              (attribute) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    attribute.name ?? '',
                                    style: AppTextTheme.darkTextTheme.bodyLarge,
                                  ),
                                  Obx(
                                    () => Wrap(
                                        children:
                                            attribute.values!.map((value) {
                                      final isSelected =
                                          controller.selectedAttribute[
                                                  attribute.name] ==
                                              value;
                                      final available = controller
                                          .getAttributeAvailablity(
                                              liquid.productVariations!,
                                              attribute.name!)
                                          .contains(value);

                                      return CustomChoiceChip(
                                        text: value,
                                        selected: isSelected,
                                        onSelected: available
                                            ? (selected) {
                                                if (selected && available) {
                                                  controller
                                                      .onAttributeSelected(
                                                          liquid,
                                                          attribute.name ?? '',
                                                          value);
                                                  cartController
                                                      .updateAlreadyAddedProduct(
                                                          liquid);
                                                }
                                              }
                                            : null,
                                      );
                                    }).toList()),
                                  ),
                                ],
                              ),
                            )
                            .toList()),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSection),

                  Obx(() => Container(
                        // padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: AppColor.darkGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => cartController
                                                .productQuantityInCart.value <
                                            1
                                        ? null
                                        : cartController
                                            .productQuantityInCart.value -= 1),
                                Text(
                                    cartController.productQuantityInCart.value
                                        .toString(),
                                    style: const TextStyle(fontSize: 18.0)),
                                IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => cartController
                                        .productQuantityInCart.value += 1),
                              ],
                            ),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColor.darkGrey.withOpacity(0.4),
                                  ),
                                  onPressed: () => cartController
                                              .productQuantityInCart.value <
                                          1
                                      ? null
                                      : cartController.addToCart(liquid),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Add to Cart'),
                                      SizedBox(width: AppSizes.sm),
                                      Icon(Icons.shopping_cart_outlined)
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: AppSizes.spaceBtwSection),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.darkGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Description'),
                          const SizedBox(height: AppSizes.md),
                          Text(liquid.description ?? '')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
