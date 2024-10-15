import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/view/shop/model/lines_model.dart';

class LinesRepo extends GetxController {
  LinesRepo get instance => Get.find();

  final _lines = FirebaseFirestore.instance.collection('Lines');

  //  Fetch categories form fb

  Future<List<LinesModel>> getLines() async {
    try {
      final snapShot = await _lines.get();
      final list = snapShot.docs
          .map((document) => LinesModel.fromSnapshot(document))
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
