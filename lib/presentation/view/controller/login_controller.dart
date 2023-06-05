import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/model/login_model.dart';

class LoginControllerNotifier extends StateNotifier<bool> {
  Ref ref;

  LoginControllerNotifier(
    this.ref,
  ) : super(false);

  void loginWithEmailAndPassWord(
      LoginModel loginModel, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await ref
          .read(authServiceProvider)
          .signInWithEmailAndPassword(loginModel: loginModel);

      state = true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'user-not-found') {
        log("dont found this account");
      } else if (e.code == 'wrong-password') {
        log("wrong password");
      }
    } catch (e) {
      Navigator.of(context).pop();
      log(e.toString());
    }
  }

  void loginWithFacebook(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await ref.read(authServiceProvider).signInWithFacebook();

      state = true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'account-exists-with-different-credential') {
        log("account-exists-with-different-credential");
      } else if (e.code == 'invalid-credential') {
        log("invalid-credential");
      }
    } catch (e) {
      Navigator.of(context).pop();
      log("$e aaa");
    }
  }

  void loginWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await ref.read(authServiceProvider).signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'account-exists-with-different-credential') {
        log("account-exists-with-different-credential");
      } else if (e.code == 'invalid-credential') {
        log("invalid-credential");
      }
    } catch (e) {
      Navigator.of(context).pop();
      log("$e aaa");
    }

    state = true;
  }

  void logout() async {
    await ref.read(authServiceProvider).logout();

    state = false;
  }

  void setState(bool value) => state;
}

final loginControllerProvider =
    StateNotifierProvider<LoginControllerNotifier, bool>((ref) {
  return LoginControllerNotifier(ref);
});
