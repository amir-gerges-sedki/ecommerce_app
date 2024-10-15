import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:master_store/core/formatter/formatters.dart';

class AddressesModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressesModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    this.dateTime,
    this.selectedAddress = true,
  });
  String get formattedPhoneNo => Format.formatPhoneNumber(phoneNumber);

  static AddressesModel empty() => AddressesModel(
      id: '', name: '', phoneNumber: '', street: '', city: '', state: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'dateTime': DateTime.now(),
      'selectedAddress': selectedAddress,
    };
  }

  factory AddressesModel.fromMap(Map<String, dynamic> data) {
    return AddressesModel(
      id: data['id'] as String,
      name: data['name'] as String,
      phoneNumber: data['phoneNumber'] as String,
      street: data['street'] as String,
      city: data['city'] as String,
      state: data['state'] as String,
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      selectedAddress: data['selectedAddress'] as bool,
    );
  }

  factory AddressesModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressesModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      selectedAddress: data['selectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$street,$city,$state';
  }
}
