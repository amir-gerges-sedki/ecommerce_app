import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/view/shop/model/banner_model.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();
  final _banner = FirebaseFirestore.instance.collection('Banners');

  //  Fetch categories form fb

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapShot = await _banner.where('active', isEqualTo: true).get();
      final list = snapShot.docs
          .map((document) => BannerModel.fromSnapshot(document))
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
