class CartItemModel {
  String productId;
  String variationId;
  String? name;
  String? image;
  int price;
  int? salePrice;
  int quantity;
  String? lineName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.variationId,
    this.name,
    this.image,
    required this.price,
    this.salePrice,
    required this.quantity,
    this.lineName,
    this.selectedVariation,
  });

  // Empty helper function
  static CartItemModel empty() =>
      CartItemModel(quantity: 0, price: 0, productId: '', variationId: '');

  // Convert model to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'variationId': variationId,
      'name': name,
      'image': image,
      'price': price,
      'salePrice': salePrice,
      'quantity': quantity,
      'lineName': lineName,
      'selectedVariation': selectedVariation,
    };
  }

  // Create a model from JSON
  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    return CartItemModel(
      productId: data['productId'] ?? '',
      variationId: data['variationId'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      price: data['price'] ?? 0,
      salePrice: data['salePrice'] ?? 0,
      quantity: data['quantity'] ?? 1,
      lineName: data['lineName'] ?? '',
      selectedVariation: data['selectedVariation'] != null
          ? Map<String, String>.from(data['selectedVariation'])
          : null,
    );
  }
}
