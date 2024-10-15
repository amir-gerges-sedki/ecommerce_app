import 'dart:convert';

import 'package:get/get.dart';
import 'package:master_store/core/services/services.dart';
import 'package:master_store/data/repositories/liquids/liquid_repo.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    getFavouritesProduct();
  }

  Future<void> saveFavouriteslocally() async {
    final encodedFavourites = json.encode(favourites);
    await myServices.sharedpref
        .setString('favouriteProduct', encodedFavourites);
    getFavouritesProduct();
  }

  Future<void> getFavouritesProduct() async {
    final json = myServices.sharedpref.getString('favouriteProduct');
    if (json != null) {
      final storedFavourites = await jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavouite(String productId) {
    return favourites[productId] ?? false;
  }

  Future<void> toggleFavouriteProduct(String productId) async {
    if (favourites[productId] == true) {
      favourites.remove(productId);
    } else {
      favourites[productId] = true;
    }
    await saveFavouriteslocally();
    favourites.refresh();
  }

  Future<List<LiquidProductModel>> favouriteProducts() async {
    return await LiquidsRepo.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
