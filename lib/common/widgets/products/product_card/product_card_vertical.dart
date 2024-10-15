import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/styles/shadows.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/common/widgets/products/icons/favourite_icon.dart';
import 'package:master_store/common/widgets/text/category_title.dart';
import 'package:master_store/common/widgets/text/product_title_text.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/app_theme.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';
import 'package:master_store/view/shop/controller/products/variation_controller.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';
import 'package:master_store/view/shop/screen/home/widgets/round_image.dart';
import 'package:master_store/view/shop/screen/product_details/Widgets/product_price.dart';
import 'package:master_store/view/shop/screen/product_details/product_details_screen.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical(
      {super.key,
      this.image,
      this.name,
      this.produtId = '',
      this.title,
      this.price,
      required this.liquid,
      this.salePrice});

  final LiquidProductModel liquid;

  final String? image, name, title;
  final String produtId;
  final int? price, salePrice;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final cartController = Get.put(CartController());
    final productQuantityInCart =
        cartController.getProductQuantityInCart(liquid.id);
    final salePercentage =
        controller.calCulateSalePercentage(liquid.price, liquid.salePrice);
    final dark = HelperFun.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(liquid: liquid)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            boxShadow: [ShadowStyle.verticalProductShadow],
            color: dark ? AppColor.darkerGrey.withOpacity(.2) : AppColor.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainer(
              height: 150,
              width: 165,
              backgroundColor: dark ? AppColor.dark : AppColor.light,
              child: Stack(
                children: [
                  RoundImage(
                    isNetworkImage: true,
                    url: liquid.image,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),
                  if (salePercentage == 0.toString())
                    const SizedBox()
                  else
                    Positioned(
                        top: 1,
                        child: RoundedContainer(
                            radius: AppSizes.borderRadiusSm,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.sm, vertical: AppSizes.xs),
                            backgroundColor: AppColor.secondry.withOpacity(0.8),
                            child: Text(
                              '$salePercentage%',
                              style: AppTextTheme.darkTextTheme.labelLarge!
                                  .apply(color: AppColor.dark),
                            ))),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FavouriteIcon(productId: liquid.id)),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: ProductTitleText(
                textSmall: true,
                title: liquid.name,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSizes.sm, top: AppSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTitle(
                    title: liquid.lineName.name,
                    iconColor: AppColor.primary,
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppSizes.sm, bottom: AppSizes.xs),
                  child: salePercentage == 0.toString()
                      ? Row(
                          children: [
                            ProductPrice(
                              price: liquid.price.toString(),
                              isLage: true,
                            ),
                            Text(' egp',
                                style: AppTheme.darkMode.textTheme.bodySmall),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductPrice(
                                price: liquid.price.toString(),
                                lineThriugh: true),
                            const SizedBox(width: AppSizes.sm),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductPrice(
                                    price: '${liquid.salePrice}', isLage: true),
                                Text(' egp',
                                    style:
                                        AppTheme.darkMode.textTheme.bodySmall),
                              ],
                            ),
                          ],
                        ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: productQuantityInCart > 0
                            ? AppColor.primary
                            : AppColor.dark,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(AppSizes.productImageRadius))),
                    child: IconButton(
                        onPressed: () {
                          if (liquid.productType == "productType.single") {
                            final cartItem =
                                cartController.convertToCartItem(liquid, 1);
                            cartController.addOneCart(cartItem);
                          } else {
                            Get.to(() => ProductDetailsScreen(liquid: liquid));
                          }
                        },
                        icon: productQuantityInCart > 0
                            ? Text(productQuantityInCart.toString())
                            : const Icon(Icons.add)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
