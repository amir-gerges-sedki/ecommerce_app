import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:master_store/core/formatter/formatters.dart';

class UserModel {
  String userName, phone, email, id;
  String image;

  UserModel({
    required this.email,
    required this.phone,
    required this.userName,
    required this.id,
    required this.image,
  });

  String get formatted => Format.formatPhoneNumber(phone);
  static UserModel empty() => UserModel(
        image: '',
        email: '',
        phone: '',
        userName: '',
        id: '',
      );

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data();
      return UserModel(
        userName: data?['userName'],
        phone: data?['phone'],
        email: data?['email'],
        id: data?['id'],
        image: data?['image'],
      );
    } else {
      return UserModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phone': phone,
      'email': email,
      'id': id,
      'image': image,
    };
  }
}
