import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/common/widgets/text/category_title.dart';
import 'package:master_store/common/widgets/text/product_title_text.dart';
import 'package:master_store/core/constant/app_colors.dart';

import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/variation_controller.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';
import 'package:master_store/view/shop/screen/product_details/Widgets/product_price.dart';

class DiscountAndShare extends StatelessWidget {
  const DiscountAndShare({
    super.key,
    required this.liquid,
  });

  final LiquidProductModel liquid;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());

    return Obx(() {
      final salePercentage = controller.calCulateSalePercentage(
        controller.selectedVariation.value.id.isNotEmpty
            ? controller.selectedVariation.value.price
            : liquid.price,
        controller.selectedVariation.value.id.isNotEmpty
            ? controller.selectedVariation.value.salePrice
            : liquid.salePrice,
      );

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: liquid.name,
                    maxLine: 1,
                    textSmall: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
                  CategoryTitle(
                    title: liquid.lineName.name,
                  ),
                  if (salePercentage != '0')
                    Row(
                      children: [
                        Text('Discount',
                            style: AppTextTheme.darkTextTheme.bodyMedium),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        RoundedContainer(
                          radius: AppSizes.borderRadiusSm,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.sm, vertical: AppSizes.xs),
                          backgroundColor: AppColor.secondry.withOpacity(0.8),
                          child: Text(
                            '$salePercentage%',
                            style: AppTextTheme.darkTextTheme.labelLarge!
                                .apply(color: AppColor.dark),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  if (salePercentage == '0')
                    ProductPrice(
                      price: controller.selectedVariation.value.id.isNotEmpty
                          ? '${controller.selectedVariation.value.price} egp'
                          : '${liquid.price} egp',
                      maxline: 1,
                      isLage: true,
                    )
                  else
                    Row(
                      children: [
                        ProductPrice(
                          price: controller
                                  .selectedVariation.value.id.isNotEmpty
                              ? '${controller.selectedVariation.value.price} egp'
                              : '${liquid.price} egp',
                          maxline: 1,
                          lineThriugh: true,
                        ),
                        const SizedBox(width: AppSizes.defaultSpace),
                        ProductPrice(
                          price: controller
                                  .selectedVariation.value.id.isNotEmpty
                              ? '${controller.selectedVariation.value.salePrice} egp'
                              : '${liquid.salePrice} egp',
                          maxline: 1,
                          isLage: true,
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      );
    });
  }
}
