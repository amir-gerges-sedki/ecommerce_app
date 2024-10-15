import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllImages(LiquidProductModel liquid) {
    Set<String> images = {};

    images.add(liquid.image);
    selectedProductImage.value = liquid.image;

    if (liquid.images != null) {
      images.addAll(liquid.images!);
    }

    // if (liquid.productVariations != null) {
    //   images
    //       .addAll(liquid.productVariations!.map((varition) => varition.image));
    // }
    return images.toList();
  }

  //show image

  void showImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.defaultSpace * 2,
                  horizontal: AppSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: AppSizes.spaceBtwSection * 2),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 130,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('close')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
