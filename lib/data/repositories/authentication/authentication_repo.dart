import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_auth_ex.dart';
import 'package:master_store/core/exceptions/firebase%20_exp/firebase_exp.dart';
import 'package:master_store/core/exceptions/format_exp.dart';
import 'package:master_store/core/exceptions/platform_exp.dart';
import 'package:master_store/data/repositories/user/user_repo.dart';
import 'package:master_store/view/auth/screens/signup/verfiy_email_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAllNamed(AppRoute.bottomNavBar);
      } else {
        Get.offAll(() => VerfiyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('firstTime', true);
      deviceStorage.read('firstTime') != true
          ? Get.offAllNamed(AppRoute.login)
          : Get.offAllNamed(AppRoute.onBoardingScreen);
    }
  }

  //--------------Email & Password Sign in----------------

  //Register

  Future<UserCredential?> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
      return null;
    }
  }

  //Login with Email && password

  Future<UserCredential?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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
      return null;
    }
  }

  //verified Email

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  //Forget password

  Future<void> sendPasswordResentEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  //Login with Google

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
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
      return null;
    }
  }

//Log out

  Future<UserCredential?> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Get.offAllNamed(AppRoute.login);
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
    return null;
  }

  // delete user account
  Future<UserCredential?> deleteUserAccount() async {
    try {
      await UserRepository.instance.deleteSUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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
    return null;
  }
}
