import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/view/shop/model/liquid_product_model.dart';

class LiquidsRepo extends GetxController {
  static LiquidsRepo get instance => Get.find();

  final _lines = FirebaseFirestore.instance.collection('Liquids');

  //  Fetch categories form fb

  Future<List<LiquidProductModel>> getLiquid() async {
    try {
      final snapShot = await _lines.where('isFeature', isEqualTo: true).get();
      final list = snapShot.docs
          .map((document) => LiquidProductModel.fromSnapshot(document))
          .toList();
      return list;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } catch (e) {
      throw 'something is  error';
    }
  }

  Future<List<LiquidProductModel>> getFavouriteProducts(
      List<String> productId) async {
    try {
      // Remove any empty or null product IDs
      productId = productId.where((id) => id.isNotEmpty).toList();

      if (productId.isEmpty) {
        throw Exception(
            'Product ID list is empty or contains invalid entries.');
      }

      final snapshot =
          await _lines.where(FieldPath.documentId, whereIn: productId).get();
      final list = snapshot.docs
          .map((document) => LiquidProductModel.fromSnapshot(document))
          .toList();
      return list;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } catch (e) {
      throw 'something is  error';
    }
  }
}
