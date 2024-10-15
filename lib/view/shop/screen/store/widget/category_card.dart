import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/images/circular_image.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/screen/subcategories/subcategories_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    this.image = '',
    this.height = 80,
    this.width = 80,
  });
  final String title, image;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SubcategoriesScreen()),
      child: Padding(
        padding: const EdgeInsets.only(left: AppSizes.md),
        child: Column(
          children: [
            Flexible(
              child: CircularImage(
                width: width,
                height: height,
                image: image,
                isNetworkImage: true,
              ),
            ),
            Text(
              title,
              style: AppTextTheme.darkTextTheme.labelMedium!
                  .apply(color: AppColor.white),
            )
          ],
        ),
      ),
    );
  }
}
