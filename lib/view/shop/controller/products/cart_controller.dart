import 'dart:convert';

import 'package:get/get.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/services/services.dart';
import 'package:master_store/view/shop/controller/products/variation_controller.dart';
import 'package:master_store/view/shop/model/cart_model.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt numberOfCartItem = 0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxInt totalcartPrice = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationsController = Get.put(VariationController());
  MyServices myServices = Get.find();

  CartController() {
    getCartItems();
  }

  // Add items to Cart

  void addToCart(LiquidProductModel product) {
    // check quantitys
    if (productQuantityInCart.value < 1) {
      HelperFun.customToast(massage: 'Select Quantity');
      return;
    }

    if (product.productType == 'productType.variable' &&
        variationsController.selectedVariation.value.id.isEmpty) {
      HelperFun.customToast(massage: 'Select Variation');
      return;
    }

    if (product.productType != 'productType.variable') {
      // variationsController.selectedVariation.value.isAvailable = false;
      HelperFun.warningSnackbar(message: 'Not Available');
      return;
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    HelperFun.customToast(massage: 'Your product has been added to the Cart');
  }

  // convert Liquid model to cart model

  CartItemModel convertToCartItem(LiquidProductModel product, int quantity) {
    if (product.productType == "productType.single") {
      variationsController.resetSelectedAttriutes();
    }

    final variation = variationsController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      variationId: variation.id,
      price: price,
      quantity: quantity,
      name: product.name,
      image: isVariation && variation.image.isNotEmpty
          ? variation.image
          : product.image,
      lineName: product.lineName.name,
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  //update Cart Total

  void updateCartTotal() {
    int calculatedTotalPrice = 0;
    int claculutedNumOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity;
      claculutedNumOfItems += item.quantity;
    }

    totalcartPrice.value = calculatedTotalPrice;
    numberOfCartItem.value = claculutedNumOfItems;
  }

  void addOneCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart(); // Update cart total and item count
    update(); // Refresh the UI
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromDialog(index)
            : cartItems.removeAt(index);
      }
    }

    updateCart(); // Update cart total and item count
    update(); // Refresh the UI
  }

  void removeFromDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are youu sure waant to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        update();
        HelperFun.customToast(massage: 'product removed from the  cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProduct(LiquidProductModel product) {
    if (product.productType == 'productType.single') {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationsController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationsQuantityInCart(product.id, variationId);
        update();
      } else {
        productQuantityInCart.value = 0;
      }
    }
    update();
  }

  // save Cart Items

  void saveCartItems() {
    final cartItemStrings =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    myServices.sharedpref.setStringList('cartItem', cartItemStrings);
  }

  // getCartItems

  void getCartItems() async {
    final storedCartItems = myServices.sharedpref.getStringList('cartItem');
    if (storedCartItems != null) {
      cartItems.assignAll(storedCartItems
          .map((item) =>
              // Decode the JSON string into a map
              CartItemModel.fromJson(jsonDecode(item) as Map<String, dynamic>))
          .toList());
      updateCartTotal();
      update();
    }
  }

  // update cart values
  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationsQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    update();
  }
}
