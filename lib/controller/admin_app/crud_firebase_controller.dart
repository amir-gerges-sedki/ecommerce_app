import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:master_store/core/constant/routes_app.dart';

abstract class CRUDCategoryController extends GetxController {
  addCategory();
  deleteCategory(i);
  updateCategory(i);
}

class CRUDCategoryControllerImp extends CRUDCategoryController {
  List<QueryDocumentSnapshot> data = [];
  GlobalKey<FormState> CategoryKey = GlobalKey<FormState>();
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  TextEditingController categoryName = TextEditingController();
  TextEditingController oldName = TextEditingController();
  final String newName = "";

  @override
  void onInit() {
    super.onInit();
    getCategory();
    // categoryName.text = oldName.text;
  }

  @override
  Future addCategory() async {
    await category.add({'categoryName': categoryName.text});
    update();
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  Future deleteCategory(i) async {
    await category.doc(data[i].id).delete().then((value) => update());
  }

  @override
  Future updateCategory(i) async {
    return category.doc(data[i].id).update({"categoryName": categoryName.text});
  }

  Future getCategory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("category").get();
    data.addAll(querySnapshot.docs);
    update();
  }
}
