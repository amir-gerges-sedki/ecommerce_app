import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/curved_edges/curved_edge.dart';
import 'package:master_store/common/widgets/products/icons/favourite_icon.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/device/device_utiles.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/view/shop/controller/products/images_controller.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';
import 'package:master_store/view/shop/screen/home/widgets/round_image.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.liquid,
  });
  final LiquidProductModel liquid;
  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagesController());
    final images = imageController.getAllImages(liquid);
    return CurvedEdge(
        child: Container(
      color:
          HelperFun.isDarkMode(context) ? AppColor.darkerGrey : AppColor.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
              child: Center(child: Obx(() {
                final image = imageController.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => imageController.showImage(image),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    progressIndicatorBuilder: (_, __, progress) =>
                        CircularProgressIndicator(
                            value: progress.progress, color: AppColor.primary),
                  ),
                );
              })),
            ),
          ),
          Positioned(
            bottom: 30,
            left: DeviceUtils.getScreenWidth() / 6,
            child: SizedBox(
              height: 60,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, index) => Obx(() {
                  final selectedImage =
                      imageController.selectedProductImage.value ==
                          images[index];
                  return RoundImage(
                      onTap: () => imageController.selectedProductImage.value =
                          images[index],
                      isNetworkImage: true,
                      url: images[index],
                      width: 80,
                      backgroundColor: HelperFun.isDarkMode(context)
                          ? AppColor.dark
                          : AppColor.white,
                      borderRadius: AppSizes.productImageRadius,
                      border: Border.all(
                          color: selectedImage
                              ? AppColor.primary
                              : AppColor.black),
                      padding: AppSizes.sm);
                }),
                itemCount: images.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: AppSizes.spaceBtwItems),
              ),
            ),
          ),
          CustomAppBar(
            showBachArrow: true,
            action: [FavouriteIcon(productId: liquid.id)],
            leadingIcon: Icons.favorite_outline,
          ),
        ],
      ),
    ));
  }
}
