import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/cards/checkout.dart';
import 'package:master_store/common/widgets/custom_shape/rounded_container.dart';
import 'package:master_store/common/widgets/products/cart/coupon_code.dart';
import 'package:master_store/common/widgets/success_screen/success_screen.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/common/widgets/products/cart/items_cart.dart';
import 'package:master_store/view/shop/screen/checkout/Widgets/billing_addresses.dart';
import 'package:master_store/view/shop/screen/checkout/Widgets/billing_payment.dart';
import 'package:master_store/view/shop/screen/checkout/Widgets/billing_total.dart';

class ChechOutScreen extends StatelessWidget {
  const ChechOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFun.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
          title: Text(AppStrings.orderReview,
              style: AppTextTheme.darkTextTheme.headlineSmall),
          showBachArrow: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Checkout(
          onPressed: () => Get.to(() => SuccessScreen(
              title: AppStrings.paymentSuccessful,
              subTitle: AppStrings.yourOrderisshippingnow,
              buttonTitle: AppStrings.continueShopping,
              image: ImageAssets.appLogo,
              onPressed: () => Get.offAllNamed(AppRoute.bottomNavBar))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const ItemsCart(
                isShowaddremoveitem: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwSection),
              const CouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSection),
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: dark ? AppColor.black : AppColor.white,
                child: const Column(
                  children: [
                    BillingTotals(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    BillingPayment(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    BillingAddresses(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
