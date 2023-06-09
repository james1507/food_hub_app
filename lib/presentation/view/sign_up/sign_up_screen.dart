// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/model/sign_up_model.dart';
// import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/sign_up/widgets/sign_up_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool _passwordVisible = false;
  AuthServiceImpl authServiceImpl = AuthServiceImpl();
  String errorFullName = "";
  String errorEmail = "";
  String errorPassword = "";

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignUpModel signUpModel = const SignUpModel();

  @override
  void dispose() {
    super.dispose();

    SignUpWidget.formLoginGroup.reset();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, ((previous, next) {
      if (next == true) {
        if (FirebaseAuth.instance.currentUser?.phoneNumber == null) {
          Navigator.pushNamed(context, '/verification_email');
        } else {
          Navigator.pushNamed(context, '/home');
        }
      }
    }));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWidget.topImage(context),
            CustomWidget.spaceH(10),
            CustomTextWidget.titleName(
                context, AppLocalizations.of(context)!.signUp),
            CustomWidget.spaceH(31),
            SignUpWidget.reactiveFormSignUp(
              context,
              onPressed: () {
                setState(
                  () {
                    _passwordVisible = !_passwordVisible;
                  },
                );
              },
              isVisible: _passwordVisible,
              fullNameController: fullNameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            SignUpWidget.signUpButtonWidget(
              context,
              onPress: () {
                setState(() {
                  signUpModel = signUpModel.copyWith(
                      email: emailController.text,
                      fullName: fullNameController.text,
                      password: passwordController.text);
                });
                if (SignUpWidget.formLoginGroup.valid) {
                  ref
                      .read(authControllerProvider.notifier)
                      .signUpWithEmailAndPassWord(signUpModel, context);
                } else {
                  CustomWidget.errorDialog(context,
                      errorString:
                          AppLocalizations.of(context)!.dialogEnterInput);
                }

                // await signUpUser(signUpModel: signUpModel);
              },
            ),
            CustomWidget.spaceH(10),
            SignUpWidget.signUpWithPhoneNumber(
              context,
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up_phone');
              },
            ),
            SignUpWidget.alreadyAccountQuestion(
              context,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            CustomWidget.spaceH(10),
            CustomTextWidget.signInWith(context,
                colorText: AppColors.titleTextFieldColor,
                colorLine: AppColors.titleTextFieldColor),
            CustomWidget.spaceH(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonWidget.authSocialLoginButton(
                  context,
                  onPress: () {
                    ref
                        .read(authControllerProvider.notifier)
                        .loginWithFacebook(context);
                  },
                  socialPic: ImagePaths.facebookIcon,
                  text: 'FACEBOOK',
                ),
                CustomWidget.spaceW(20),
                CustomButtonWidget.authSocialLoginButton(
                  context,
                  onPress: () {
                    ref
                        .read(authControllerProvider.notifier)
                        .loginWithGoogle(context);
                  },
                  socialPic: ImagePaths.googleIcon,
                  text: 'GOOGLE',
                ),
              ],
            ),
            CustomWidget.spaceH(20),
          ],
        ),
      ),
    );
  }

  // signUpUser({required SignUpModel signUpModel}) async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;

  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;

  //   signUpModel = signUpModel.copyWith(id: uid);

  //   final docUser =
  //       FirebaseFirestore.instance.collection('users').doc(signUpModel.id);

  //   final json = {
  //     'id': signUpModel.id,
  //     'fullName': signUpModel.fullName,
  //     'email': signUpModel.email,
  //   };

  //   await docUser.set(json);
  // }
}
