import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/model/login_model.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

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
        CustomWidget.errorDialog(context,
            errorString: "dont found this account");

        log("dont found this account");
      } else if (e.code == 'wrong-password') {
        CustomWidget.errorDialog(context, errorString: "wrong password");
      } else if (e.code == 'invalid-email') {
        CustomWidget.errorDialog(context,
            errorString: "email address is not valid");

        log("email address is not valid");
      }
    } catch (e) {
      Navigator.of(context).pop();
      CustomWidget.errorDialog(context,
          errorString: "An unexpected error occurred");

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
        CustomWidget.errorDialog(context,
            errorString:
                "already exists an account with the email address asserted by the credential");
        log("already exists an account with the email address asserted by the credential");
      } else if (e.code == 'credential is malformed or has expired') {
        CustomWidget.errorDialog(context,
            errorString: "credential is malformed or has expired");

        log("credential is malformed or has expired");
      }
    } catch (e) {
      Navigator.of(context).pop();
      CustomWidget.errorDialog(context,
          errorString: "An unexpected error occurred");
      log("$e");
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

      state = true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'account-exists-with-different-credential') {
        CustomWidget.errorDialog(context,
            errorString:
                "already exists an account with the email address asserted by the credential");
        log("already exists an account with the email address asserted by the credential");
      } else if (e.code == 'credential is malformed or has expired') {
        CustomWidget.errorDialog(context,
            errorString: "credential is malformed or has expired");

        log("credential is malformed or has expired");
      }
    } catch (e) {
      Navigator.of(context).pop();
      CustomWidget.errorDialog(context,
          errorString: "An unexpected error occurred");
      log("$e");
    }
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
