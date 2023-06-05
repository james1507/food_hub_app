import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/model/login_model.dart';
import 'package:food_hub_app/model/sign_up_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider =
    Provider.autoDispose<AuthService>((ref) => AuthServiceImpl());

abstract class AuthService {
  Future<UserCredential> signUpWithEmailAndPassword({SignUpModel? signUpModel});

  Future<UserCredential> signInWithEmailAndPassword({LoginModel? loginModel});

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithFacebook();

  logout();
}

class AuthServiceImpl implements AuthService {
  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      {SignUpModel? signUpModel}) async {
    // try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpModel!.email!,
      password: signUpModel.password!,
    );

    User? user = credential.user;
    user?.updateDisplayName(signUpModel.fullName);

    return credential;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     return null;
    //   } else if (e.code == 'email-already-in-use') {
    //     return null;
    //   }
    // } catch (e) {
    //   return null;
    // }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {LoginModel? loginModel}) async {
    // try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginModel?.email ?? "",
      password: loginModel?.password ?? "",
    );

    return credential;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     log("dont find your account");
    //     return null;
    //   } else if (e.code == 'wrong-password') {
    //     log("wrong password");
    //     return null;
    //   } else {
    //     log(e.code);
    //     return null;
    //   }
    // }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    // if (result.status == LoginStatus.success) {
    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  logout() async {
    FirebaseAuth.instance.signOut();
  }
  // return null;
}
