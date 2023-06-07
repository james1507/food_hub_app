// import 'package:firebase_auth/firebase_auth.dart';

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
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, ((previous, next) {
      if (next == true) {
        Navigator.pushNamed(context, '/home');
      }
    }));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWidget.topImage(context),
            CustomWidget.spaceH(10),
            CustomTextWidget.titleName("Sign Up"),
            CustomWidget.spaceH(31),
            SignUpWidget.reactiveFormSignUp(
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
                      errorString: "Please enter done input");
                }

                // await signUpUser(signUpModel: signUpModel);
              },
            ),
            CustomWidget.spaceH(10),
            SignUpWidget.signUpWithPhoneNumber(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up_phone');
              },
            ),
            SignUpWidget.alreadyAccountQuestion(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            CustomWidget.spaceH(10),
            CustomTextWidget.signInWith(
                colorText: AppColors.titleTextFieldColor,
                colorLine: AppColors.titleTextFieldColor),
            CustomWidget.spaceH(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonWidget.authSocialLoginButton(
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
