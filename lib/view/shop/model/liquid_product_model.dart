import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:master_store/view/shop/model/lines_model.dart';
import 'package:master_store/view/shop/model/product_attribute_model.dart';
import 'package:master_store/view/shop/model/product_variation_mode.dart';

class LiquidProductModel {
  String id;
  String name;
  String image;
  String? description;
  String? productType;
  List<String>? images;
  int price;
  int salePrice;
  bool isFeature;
  LinesModel lineName;
  List<ProductAttributeModel>? productAttribute;
  List<ProductVariationModel>? productVariations;

  LiquidProductModel({
    this.id = '',
    required this.name,
    required this.image,
    this.description,
    this.productType,
    this.images,
    required this.price,
    required this.salePrice,
    required this.isFeature,
    required this.lineName,
    this.productVariations,
    this.productAttribute,
  });

  // Empty helper function
  static LiquidProductModel empty() => LiquidProductModel(
        id: '',
        name: '',
        image: '',
        productType: "productType.variable",
        images: [],
        lineName: LinesModel.empty(),
        price: 0,
        salePrice: 0,
        isFeature: false,
        description: '',
      );

  // Convert model to JSON
  toJson() {
    return {
      'name': name,
      'image': image,
      'images': images,
      'description': description,
      'productType': productType,
      'price': price,
      'salePrice': salePrice,
      'isFeature': isFeature,
      'lineName': lineName.toJson(),
      'productAttribute': productAttribute != null
          ? productAttribute!.map((e) => e.toJson()).toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  // Create a model from JSON
  factory LiquidProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return LiquidProductModel.empty();
    final data = document.data()!;
    return LiquidProductModel(
      id: document.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      productType: data['productType'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      isFeature: data['isFeature'] ?? false,
      price: data['price'] ?? 0,
      salePrice: data['salePrice'] ?? 0,
      lineName: LinesModel.fromJson(data['lineName']),
      productAttribute: data['productAttribute'] != null
          ? (data['productAttribute'] as List<dynamic>)
              .map((e) =>
                  ProductAttributeModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      productVariations: data['productVariations'] != null
          ? (data['productVariations'] as List<dynamic>)
              .map((e) =>
                  ProductVariationModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}
