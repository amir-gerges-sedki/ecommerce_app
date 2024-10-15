import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';

import 'package:master_store/common/widgets/custom_shape/custom_searc.dart';
import 'package:master_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:master_store/common/widgets/shimmer/categories_shimmer.dart';
import 'package:master_store/common/widgets/text/section_title.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/personlization/controller/user_controller.dart';
import 'package:master_store/view/shop/controller/products/liquid_product_controller.dart';
import 'package:master_store/view/shop/screen/home/widgets/categories_home.dart';
import 'package:master_store/view/shop/screen/home/widgets/custom_carousel.dart';
import 'package:master_store/view/shop/screen/home/widgets/header_container.dart';
import 'package:master_store/view/shop/screen/home/widgets/counter_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final liquidsController = Get.put(LiquidProductController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      HeaderContainer(
        child: Column(
          children: [
            CustomAppBar(
              title: const ImageIcon(
                AssetImage(ImageAssets.appLogo),
                size: 40,
                // color: AppColor.white,
              ),
              action: [
                Row(
                  children: [
                    CounterIcon(
                      icon: Icons.notifications_outlined,
                      onPressed: () {},
                    ),
                    const SizedBox(width: AppSizes.sm),
                    CounterIcon(
                      icon: Icons.shopping_cart_outlined,
                      onPressed: () => Get.toNamed(AppRoute.cart),
                    )
                  ],
                )
              ],
            ),
            // const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
                padding: const EdgeInsets.only(left: AppSizes.lg),
                child: Row(
                  children: [
                    Text(AppStrings.welcome,
                        style: AppTextTheme.darkTextTheme.labelMedium!
                            .apply(color: AppColor.grey)),
                    Obx(() => Text(controller.user.value.userName,
                        style: AppTextTheme.darkTextTheme.headlineSmall))
                  ],
                )),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const CustomSearch(
              title: AppStrings.search,
              showBackground: true,
              showBorder: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const SectionTitle(
              title: AppStrings.popularCategories,
              textColor: AppColor.white,
              showButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
            const CategoriesHome(),
            const SizedBox(height: AppSizes.spaceBtwSection),
          ],
        ),
      ),
      const CustomCarouselSlider(),
      const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: SectionTitle(
          title: 'For you',
          textColor: AppColor.white,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (liquidsController.isLoading.value) {
              return CategoriesShimmer(
                  itemCount: liquidsController.allLiquids.length);
            }
            if (liquidsController.allLiquids.isEmpty) {
              return Center(
                child: Text(
                  'No found Data',
                  style: AppTextTheme.darkTextTheme.bodyMedium!
                      .apply(color: AppColor.white),
                ),
              );
            }
            return GridView.builder(
                itemCount: liquidsController.allLiquids.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 256.5,
                  mainAxisSpacing: AppSizes.gridveiwSpaceing,
                  crossAxisSpacing: AppSizes.gridveiwSpaceing,
                ),
                itemBuilder: (_, item) => ProductCardVertical(
                      image: liquidsController.allLiquids[item].image,
                      name: liquidsController.allLiquids[item].name,
                      title: liquidsController.allLiquids[item].lineName.name,
                      price: liquidsController.allLiquids[item].price,
                      salePrice: liquidsController.allLiquids[item].salePrice,
                      liquid: liquidsController.allLiquids[item],
                    ));
          })),
    ])));
  }
}
