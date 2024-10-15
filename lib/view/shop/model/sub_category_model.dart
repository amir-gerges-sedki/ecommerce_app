import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoryModel {
  String categoryId;
  List<String> productId;

  SubCategoryModel({
    this.categoryId = '',
    required this.productId,
  });

  // Empty helper function
  static SubCategoryModel empty() => SubCategoryModel(
        categoryId: '',
        productId: [],
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'productId': productId,
    };
  }

  // Create a model from JSON
  factory SubCategoryModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isNotEmpty) {
      return SubCategoryModel(
        categoryId: data['categoryId'] ?? '',
        productId:
            List<String>.from(data['productId'] ?? []), // Ensure it's a list
      );
    } else {
      return SubCategoryModel.empty();
    }
  }

  // Create a model from Firestore DocumentSnapshot
  factory SubCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      var productId = data['productId'];

      // Check if productId is a String or List<String> and handle accordingly
      if (productId is String) {
        // If it's a single string, wrap it in a list
        productId = [productId];
      } else if (productId is List) {
        // If it's already a list, cast it to List<String>
        productId = List<String>.from(productId);
      } else {
        // Fallback to an empty list if it's neither a string nor a list
        productId = [];
      }

      return SubCategoryModel(
        categoryId: document.id,
        productId: productId,
      );
    } else {
      return SubCategoryModel.empty();
    }
  }
}
