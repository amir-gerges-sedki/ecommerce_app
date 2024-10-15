import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/widgets/products/icons/circular_icon.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/view/shop/controller/favourite_controller.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final favouriteController = Get.put(FavouriteController());
    return Obx(
      () => CircularIcon(
        icon: favouriteController.isFavouite(productId)
            ? Icons.favorite
            : Icons.favorite_border_outlined,
        color:
            favouriteController.isFavouite(productId) ? AppColor.error : null,
        onPressed: () {
          favouriteController.toggleFavouriteProduct(productId);
        },
      ),
    );
  }
}
