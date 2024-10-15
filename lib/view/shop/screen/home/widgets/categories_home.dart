import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/shimmer/categories_shimmer.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/controller/lines_controller.dart';
import 'package:master_store/view/shop/screen/store/widget/category_card.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(LinesController());
    return Obx(() {
      if (categoryController.isLoading.value) return const CategoriesShimmer();

      if (categoryController.featuredLines.isEmpty) {
        return Center(
          child: Text(
            'No found Categoies',
            style: AppTextTheme.darkTextTheme.bodyMedium!
                .apply(color: AppColor.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredLines.length,
            itemBuilder: (_, item) {
              return CategoryCard(
                title: categoryController.featuredLines[item].name,
                image: categoryController.featuredLines[item].image,
              );
            }),
      );
    });
  }
}
