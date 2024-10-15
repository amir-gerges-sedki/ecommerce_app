import 'package:get/get.dart';
import 'package:master_store/view/shop/controller/products/images_controller.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';
import 'package:master_store/view/shop/model/product_variation_mode.dart';

class VariationController extends GetxController {
  RxMap selectedAttribute = {}.obs;
  RxString status = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void onAttributeSelected(
      LiquidProductModel liquid, attributeName, attributeValue) {
    final selectedAttribute = Map<String, dynamic>.from(this.selectedAttribute);
    selectedAttribute[attributeName] = attributeValue;
    this.selectedAttribute[attributeName] = attributeValue;
    final selectedVariation = liquid.productVariations!.firstWhere(
      (e) => _isSameAttributeValues(e.attributeValues, selectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
  }

  String calCulateSalePercentage(int oPrice, int? sPrice) {
    if (sPrice == 0 || sPrice == null) return 0.toString();
    double percentage = ((oPrice - sPrice) / oPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAtrrbute,
      Map<String, dynamic> selectedAtrrbutes) {
    if (variationAtrrbute.length != selectedAtrrbutes.length) return false;
    for (final key in variationAtrrbute.keys) {
      if (variationAtrrbute[key] != selectedAtrrbutes[key]) return false;
    }
    return true;
  }

  Set getAttributeAvailablity(
      List<ProductVariationModel> variations, String attributeName) {
    final availablityVariation = variations
        .where((variation) => variation.attributeValues[attributeName] != null)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availablityVariation;
  }

  void resetSelectedAttriutes() {
    selectedAttribute.clear();
    status.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
