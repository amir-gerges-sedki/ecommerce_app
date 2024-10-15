import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/products/filter_products/filter_products.dart';
import 'package:master_store/core/constant/app_colors.dart';

import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_strings.dart';

import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/products/sub_category_controller.dart';

import 'package:master_store/view/shop/screen/home/widgets/counter_icon.dart';

class SubcategoriesScreen extends StatelessWidget {
  const SubcategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final subCategoryController = Get.put(SubCategoryController());

    return DefaultTabController(
      length: subCategoryController.allTypes.length,
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
        body: Obx(() {
          if (subCategoryController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                FilterProducts(
                  items: subCategoryController.allTypes.map((subCategory) {
                    return DropdownMenuItem(
                      value: subCategory
                          .categoryId, // Use categoryId as unique value
                      child: Text(
                        subCategory.productId.isNotEmpty
                            ? subCategory
                                .productId[0] // Show the first product ID
                            : 'No products',
                        style: AppTextTheme.darkTextTheme.bodyMedium!
                            .apply(color: AppColor.white),
                      ),
                    );
                  }).toList(),
                  itemCount: subCategoryController.allTypes.length,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
