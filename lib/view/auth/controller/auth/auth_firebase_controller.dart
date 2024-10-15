// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:master_store/core/constant/app_routes.dart';

// class AuthController extends GetxController {
//   final credential = FirebaseAuth.instance;

//   initAuth() {
//     try {
//       credential.authStateChanges().listen((User? user) {
//         if (user == null) {
//           print(
//               '---------------------------------------------------------------User is currently signed out!');
//         } else {
//           print(
//               '---------------------------------------------------------User is signed in!');
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> createAccountBasedPassword(String email, String password) async {
//     try {
//       await credential.createUserWithEmailAndPassword(
//           email: email, password: password);
//       credential.currentUser?.sendEmailVerification();
//       credential.currentUser!.emailVerified
//           ? Get.offAllNamed(AppRoute.homeScreen)
//           : Get.offAllNamed(AppRoute.check);
//       Get.offAllNamed(AppRoute.successSignup);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         if (kDebugMode) {
//           print('The password provided is too weak.');
//         }
//       } else if (e.code == 'email-already-in-use') {
//         if (kDebugMode) {
//           print('The account already exists for that email.');
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> signInUser(String email, String password) async {
//     try {
//       await credential.signInWithEmailAndPassword(
//           email: email, password: password);
//       Get.offAllNamed(AppRoute.homeScreen);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         Get.snackbar('Alert!', 'Wrong password provided for that user');
//       } else if (e.code == 'wrong-password') {
//         Get.snackbar('Alert!', 'Wrong password provided for that user.');
//       } else {
//         Get.snackbar('Alert!', 'Wrong password provided for that user');
//       }
//     }
//   }

//   verifiedEmail() {
//     if (FirebaseAuth.instance.currentUser!.emailVerified) {
//       Get.offAllNamed(AppRoute.homeScreen);
//     } else {
//       Get.snackbar('verfied your email', 'check your email');
//     }
//   }
// }
