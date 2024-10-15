import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_store/core/constant/app_assets.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/helper/helper.dart';
import 'package:master_store/core/services/services.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';
import 'package:master_store/data/repositories/user/user_repo.dart';
import 'package:master_store/view/auth/model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  MyServices myServices = Get.find();
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final storageRef = FirebaseStorage.instance.ref();
  File? file;
  String? profilePicPath;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  @override
  void onReady() {
    super.onReady();
    getProfileImage();
    fetchUserRecord();
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  //Save User recoed from any Registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final user = UserModel(
            email: userCredential.user!.email ?? '',
            phone: userCredential.user!.phoneNumber ?? '',
            image: userCredential.user!.photoURL ?? '',
            userName: userCredential.user!.displayName ?? '',
            id: userCredential.user!.uid,
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      HelperFun.warningSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information, You can re-save your data in your profile. ');
    }
  }

//Delete user Account
  void deleteUserAccount() async {
    try {
      HelperFun.openLoadingDialog('Processing', ImageAssets.appLogo);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteUserAccount();
          HelperFun.stopLoader();
          Get.offAllNamed(AppRoute.login);
        } else if (provider == 'password') {
          HelperFun.stopLoader();
          AuthenticationRepository.instance.deleteUserAccount();
        }
      }
    } catch (e) {
      HelperFun.stopLoader();
      HelperFun.warningSnackbar(message: e.toString());
    }
  }
//Delete Account dialog

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(AppSizes.md),
        title: 'Delete Account',
        middleText: 'you want delete your account??',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.error,
                side: const BorderSide(color: AppColor.error)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Get.off(Get.isOverlaysClosed),
            child: const Text('Cancel')));
  }

// change profile Picture

  void saveImagelocally(String path) {
    myServices.sharedpref.setString('imagePath', path);
    getProfileImage();
  }

  void getProfileImage() async {
    update();
    profilePicPath = myServices.sharedpref.getString('imagePath');
    update();
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
    if (pickedFile != null) {
      saveImagelocally(pickedFile.path.toString());
      file = File(pickedFile.path);

      update();
    }
  }
}
