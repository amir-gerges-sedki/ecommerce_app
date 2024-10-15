import 'package:cloud_firestore/cloud_firestore.dart';

class LinesModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeature;

  LinesModel({
    this.id = '',
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeature,
  });

  // Empty helper function
  static LinesModel empty() =>
      LinesModel(id: '', name: '', image: '', parentId: '', isFeature: false);

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeature': isFeature,
    };
  }

  // Create a model from JSON
  factory LinesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isNotEmpty) {
      return LinesModel(
        id: data['id'] ?? '',
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeature: data['isFeature'] ?? false,
      );
    } else {
      return LinesModel.empty();
    }
  }

  // Create a model from JSON
  factory LinesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return LinesModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeature: data['isFeature'] ?? false,
      );
    } else {
      return LinesModel.empty();
    }
  }
}
