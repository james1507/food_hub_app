import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/model/login_model.dart';
import 'package:food_hub_app/model/sign_up_model.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/phone_registration/verification_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthServiceImpl());

abstract class AuthService {
  Future<UserCredential> signUpWithEmailAndPassword({SignUpModel? signUpModel});

  Future<UserCredential> signInWithEmailAndPassword({LoginModel? loginModel});

  Future<String> sendOtpPhone(BuildContext context, {String phone});

  Future<UserCredential> signUpWithPhone(
      {String? verificationId, String? smsCode});

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithFacebook();

  logout();
}

class AuthServiceImpl implements AuthService {
  PhoneAuthCredential? phoneAuthCredential;

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      {SignUpModel? signUpModel}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpModel!.email!,
      password: signUpModel.password!,
    );

    User? user = credential.user;
    user?.updateDisplayName(signUpModel.fullName);

    await FirebaseAuth.instance.currentUser?.sendEmailVerification();

    return credential;
  }

  @override
  Future<String> sendOtpPhone(BuildContext context, {String phone = ""}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("aaa ${e.code}");
        if (e.code == "app-not-authorized") {
          Navigator.of(context).pop();
          CustomWidget.errorDialog(context, errorString: "app not authorized");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerificationScreen(
                    verificationIdReceived: verificationId,
                  )),
        );
      },
      timeout: const Duration(seconds: 10),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return phoneAuthCredential?.verificationId ?? "";
  }

  @override
  Future<UserCredential> signUpWithPhone(
      {String? verificationId, String? smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode!);
    // Sign the user in (or link) with the credential
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {LoginModel? loginModel}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginModel?.email ?? "",
      password: loginModel?.password ?? "",
    );

    return credential;
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      try {
        await value.user?.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        log(e.code);
      } catch (e) {
        log(e.toString());
      }

      return value;
    });
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  logout() async {
    FirebaseAuth.instance.signOut();
  }
}
