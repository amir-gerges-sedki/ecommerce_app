import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/view/shop/model/sub_category_model.dart';

class SubCollectionRepo extends GetxController {
  SubCollectionRepo get instance => Get.find();
  final String linesId;
  SubCollectionRepo({required this.linesId});

  final _subCategory = FirebaseFirestore.instance.collection('Lines');

  //  Fetch SubCategories form fb

  Future<List<SubCategoryModel>> getSubCategories() async {
    try {
      final snapShot =
          await _subCategory.doc(linesId).collection('Types').get();
      final list = snapShot.docs
          .map((document) => SubCategoryModel.fromSnapshot(document))
          .toList();
      print('list: ${list.length}');
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
