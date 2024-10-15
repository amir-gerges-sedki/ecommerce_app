class ProductVariationModel {
  final String id;
  String image;
  int price, salePrice;

  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.image = '',
    this.price = 0,
    this.salePrice = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );

  toJson() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'salePrice': salePrice,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['id'] ?? '',
      image: data['image'] ?? '',
      price: data['price'] ?? 0,
      salePrice: data['salePrice'] ?? 0,
      attributeValues: Map<String, String>.from(data['attributeValues']),
    );
  }
}
