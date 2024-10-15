import 'package:get/get.dart';
import 'package:master_store/core/device/network_manager.dart';
import 'package:master_store/view/shop/controller/products/cart_controller.dart';
import 'package:master_store/view/shop/model/product_variation_mode.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductVariationModel);
    Get.put(CartController());
  }
}
