import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/model/sign_up_model.dart';

class SignUpControllerNotifier extends StateNotifier<bool> {
  Ref ref;

  SignUpControllerNotifier(
    this.ref,
  ) : super(false);

  void signUpWithEmailAndPassWord(
      SignUpModel signUpModel, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    await ref
        .read(authServiceProvider)
        .signUpWithEmailAndPassword(signUpModel: signUpModel);

    state = true;
  }
}

final signUpControllerProvider =
    StateNotifierProvider<SignUpControllerNotifier, bool>((ref) {
  return SignUpControllerNotifier(ref);
});
