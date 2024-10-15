import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/view/shop/model/addresses_model.dart';

class AddressesRepo extends GetxController {
  static AddressesRepo get instance => Get.find();

  final _address = FirebaseFirestore.instance.collection('User');

  /// Fetch all user addresses from Firestore.
  Future<List<AddressesModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw Exception('User ID is invalid. Please try again.');
      }

      final result = await _address.doc(userId).collection('Addresses').get();

      final addressList = result.docs.map((documentSnapshot) {
        return AddressesModel.fromDocumentSnapshot(documentSnapshot);
      }).toList();

      return addressList;
    } catch (e) {
      throw Exception('Failed to fetch address information: ${e.toString()}');
    }
  }

  /// Update the `selectedAddress` field for a specific address.
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw Exception('User ID is invalid. Please try again.');
      }

      await _address
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'selectedAddress': selected});
    } catch (e) {
      throw Exception('Failed to update selected address: ${e.toString()}');
    }
  }

  /// Add a new address to Firestore and return its document ID.
  Future<String> addAddress(AddressesModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw Exception('User ID is invalid. Please try again.');
      }

      final result = await _address
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());

      return result.id;
    } catch (e) {
      throw Exception('Failed to add address: ${e.toString()}');
    }
  }
}

// class AddressesRepo extends GetxController {
//   static AddressesRepo get instance => Get.find();

//   final _address = FirebaseFirestore.instance.collection('User');

//   Future<List<AddressesModel>> fetchUserAddresses() async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       if (userId.isEmpty) throw 'Try again';
//       final result = await _address.doc(userId).collection('Addresses').get();
//       final addressList = result.docs
//           .map((documentSnapshot) =>
//               AddressesModel.fromDocumentSnapshot(documentSnapshot))
//           .toList();

//       return addressList;
//     } catch (e) {
//       throw 'Something went wrong while fetching Address info';
//     }
//   }

//   Future<void> updateSelectedField(String addressId, bool selected) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       await _address
//           .doc(userId)
//           .collection('Addresses')
//           .doc(addressId)
//           .update({'selectedAddress': selected});
//     } catch (e) {
//       throw 'Try again later';
//     }
//   }

//   Future<String> addAddress(AddressesModel address) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       final retsult = await _address
//           .doc(userId)
//           .collection('Addresses')
//           .add(address.toJson());

//       return retsult.id;
//     } catch (e) {
//       throw 'Try again later';
//     }
//   }
// }
