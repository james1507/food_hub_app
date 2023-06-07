import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

class PhoneVerificationNotifier extends StateNotifier<bool> {
  Ref ref;

  PhoneVerificationNotifier(
    this.ref,
  ) : super(false);

  void sendOtpCode(BuildContext context, {String phone = ""}) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    await ref.read(authServiceProvider).sendOtpPhone(context, phone: phone);

    state = true;
  }
}

final verificationIdControllerProvider =
    StateNotifierProvider<PhoneVerificationNotifier, bool>((ref) {
  return PhoneVerificationNotifier(ref);
});
