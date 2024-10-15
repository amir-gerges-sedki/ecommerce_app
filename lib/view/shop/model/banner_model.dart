import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String image, targetScreen;
  final bool active;
  BannerModel(
      {required this.image, required this.active, required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {'image': image, 'targetScreen': targetScreen, 'active': active};
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        image: data['image'] ?? '',
        active: data['active'] ?? false,
        targetScreen: data['targetScreen'] ?? '');
  }
}
