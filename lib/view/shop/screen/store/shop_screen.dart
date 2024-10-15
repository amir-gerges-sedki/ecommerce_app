import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/custom_shape/custom_searc.dart';
import 'package:master_store/common/widgets/appBar/custom_tap_bar.dart';
import 'package:master_store/common/widgets/laylouts/grid_layouts.dart';
import 'package:master_store/common/widgets/products/product_card/product_card_vertical.dart';

import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/liquid_product_controller.dart';

import 'package:master_store/view/shop/screen/home/widgets/counter_icon.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final liquidsController = Get.put(LiquidProductController());

    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: CustomAppBar(
            title: Text(
              AppStrings.store,
              style: AppTextTheme.darkTextTheme.headlineMedium,
            ),
            action: [
              CounterIcon(
                icon: Icons.shopping_cart_outlined,
                onPressed: () => Get.toNamed(AppRoute.cart),
              )
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (_, innerScrolling) {
                return [
                  SliverAppBar(
                      automaticallyImplyLeading: true,
                      floating: false,
                      pinned: true,
                      backgroundColor: HelperFun.isDarkMode(context)
                          ? AppColor.black
                          : AppColor.white,
                      expandedHeight: 120,
                      flexibleSpace: const Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes.defaultSpace,
                            right: AppSizes.defaultSpace,
                            bottom: AppSizes.defaultSpace,
                            top: AppSizes.defaultSpace / 2),
                        child: CustomSearch(
                          title: AppStrings.searchinStore,
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      bottom: const CustomTapAppBar(
                        tabs: [
                          Text('Liquids'),
                          Text('HardWare1'),
                          Text('HardWare2'),
                          Text('HardWare3'),
                          Text('HardWare4'),
                          Text('Disbisable'),
                          Text('pods'),
                        ],
                      ))
                ];
              },
              body: Column(
                children: [
                  Expanded(
                    child:
                        TabBarView(physics: const ScrollPhysics(), children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice: liquidsController.allLiquids[item].price,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 250,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice:
                                liquidsController.allLiquids[item].salePrice,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice: liquidsController.allLiquids[item].price,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice:
                                liquidsController.allLiquids[item].salePrice,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice: liquidsController.allLiquids[item].price,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice:
                                liquidsController.allLiquids[item].salePrice,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridLayouts(
                          itemCount: liquidsController.allLiquids.length,
                          itemBuilder: (_, item) => ProductCardVertical(
                            image: liquidsController.allLiquids[item].image,
                            name: liquidsController.allLiquids[item].name,
                            title: liquidsController
                                .allLiquids[item].lineName.name,
                            price: liquidsController.allLiquids[item].price,
                            salePrice: liquidsController.allLiquids[item].price,
                            liquid: liquidsController.allLiquids[item],
                          ),
                          mainAxisExtent: 213,
                        ),
                      ),
                    ]),
                  ),
                ].reversed.toList(),
              ))),
    );
  }
}
