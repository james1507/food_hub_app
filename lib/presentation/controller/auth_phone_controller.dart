import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

class AuthPhoneControllerNotifier extends StateNotifier<bool> {
  Ref ref;

  AuthPhoneControllerNotifier(
    this.ref,
  ) : super(false);

  void signUpWithPhone(BuildContext context,
      {String? verificationId, String? smsCode}) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      await ref
          .read(authServiceProvider)
          .signUpWithPhone(verificationId: verificationId, smsCode: smsCode);
      state = true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'invalid-phone-number') {
        CustomWidget.errorDialog(context,
            errorString: "The provided phone number is not valid.");
        log("The provided phone number is not valid.");
      }
    } catch (e) {
      Navigator.of(context).pop();
      CustomWidget.errorDialog(context,
          errorString: "An unexpected error occurred");
      log(e.toString());
    }
  }

  void sendOtpCode(BuildContext context, {String phone = ""}) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    await ref.read(authServiceProvider).sendOtpPhone(context, phone: phone);
  }

  void logout() async {
    await ref.read(authServiceProvider).logout();

    state = false;
  }
}

final authPhoneControllerProvider =
    StateNotifierProvider<AuthPhoneControllerNotifier, bool>((ref) {
  return AuthPhoneControllerNotifier(ref);
});
