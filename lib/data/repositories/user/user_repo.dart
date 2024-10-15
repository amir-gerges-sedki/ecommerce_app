import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_auth_ex.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/core/exceptions/format_exp.dart';
import 'package:master_store/core/exceptions/platform_exp.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/view/auth/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthEx(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExp();
    } on PlatformException catch (e) {
      throw PlatformExp(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Some went wrong:$e');
    }
  }

  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final decumentSnapshot = await _db
          .collection("User")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (decumentSnapshot.exists) {
        return UserModel.fromFirestore(decumentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExp();
    } on PlatformException catch (e) {
      throw PlatformExp(e.code).message;
    } catch (e) {
      throw 'Some went wrong. please try again';
    }
  }

  // Function to update user info
  Future<void> updateUserDetails(UserModel updateUserInfo) async {
    try {
      await _db
          .collection("User")
          .doc(updateUserInfo.id)
          .update(updateUserInfo.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExp();
    } on PlatformException catch (e) {
      throw PlatformExp(e.code).message;
    } catch (e) {
      throw 'Some went wrong. please try again';
    }
  }

  // Function to update any field for user info
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("User")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExp();
    } on PlatformException catch (e) {
      throw PlatformExp(e.code).message;
    } catch (e) {
      throw 'Some went wrong. please try again';
    }
  }

  // Function to remove user Record
  Future<void> deleteSUserRecord(String userID) async {
    try {
      await _db.collection("User").doc(userID).delete();
    } on FirebaseException catch (e) {
      throw FirebaseEx(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExp();
    } on PlatformException catch (e) {
      throw PlatformExp(e.code).message;
    } catch (e) {
      throw 'Some went wrong. please try again';
    }
  }
}
