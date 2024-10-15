import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';

class BillingTotals extends StatelessWidget {
  const BillingTotals({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController();
    int subtotal = controller.totalcartPrice.value;
    int tax = 6;
    int shipping = 6;
    int total = subtotal + tax + shipping;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.subtotal,
              style: AppTextTheme.darkTextTheme.bodySmall,
            ),
            Text('$subtotal ${AppStrings.egp}',
                style: AppTextTheme.darkTextTheme.bodySmall),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.taxFee,
                style: AppTextTheme.darkTextTheme.bodySmall),
            Text('$tax ${AppStrings.egp}',
                style: AppTextTheme.darkTextTheme.labelMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.shippingFee,
                style: AppTextTheme.darkTextTheme.bodySmall),
            Text('$shipping ${AppStrings.egp}',
                style: AppTextTheme.darkTextTheme.labelMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.orderTotal,
                style: AppTextTheme.darkTextTheme.bodyLarge),
            Text('$total ${AppStrings.egp}',
                style: AppTextTheme.darkTextTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
