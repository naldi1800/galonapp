import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get authStreamStatus => auth.authStateChanges();

  void login(emailAddress, password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        credential.user!.sendEmailVerification();
        await auth.signOut();
        UI.warning(
          msg: "Your email is not verify",
          confirmText: "Verify",
          action: Get.offAllNamed(Routes.LOGIN),
        );
        // Get.defaultDialog(
        //   title: "Warning!!!",
        //   middleText: "Your email is not verify",
        //   textConfirm: "Send verify email",
        //   onConfirm: () => Get.offAllNamed(Routes.LOGIN),
        // );
      } else {
        if (credential.user!.email == "maura.galon.23@gmail.com") {
          Get.offAllNamed(Routes.ADMIN_HOME);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      }

      // print(credential!.);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        UI.warning(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        UI.warning(msg: "Wrong password provided for that user.");
      }
    }
  }

  void signUpWithPass(emailAddress, password) async {
    try {
      final created = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UI.warning(msg: "Sign Up Success", title: "Info");
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        UI.warning(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        UI.warning(msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
