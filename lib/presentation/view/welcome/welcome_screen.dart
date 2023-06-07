import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/welcome/widgets/welcome_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  String userid = "";
  String username = "";
  DateTime? currentBackPressTime;
  var presscount = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, ((previous, next) {
      if (next == true) {
        Navigator.pushNamed(context, '/home');
      }
    }));
    return WillPopScope(
      onWillPop: () async {
        presscount++;

        if (presscount == 2) {
          exit(0);
        } else {
          Fluttertoast.showToast(
            msg: "press another time to exit from app",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.primaryBackgroundColor,
            textColor: AppColors.primaryTitleColor,
            fontSize: 16.0,
          );
          // var snackBar = const SnackBar(
          //     content:
          //         Center(child: Text('press another time to exit from app')));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return false;
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ImagePaths.backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: CustomStyle.gradientWelcome,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WelcomeWidget.skipButtonWidget(),
                  WelcomeWidget.titleWelcome(),
                  Column(
                    children: [
                      CustomTextWidget.signInWith(
                          colorLine: AppColors.primaryBackgroundColor),
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
                      CustomWidget.spaceH(30),
                      WelcomeWidget.startWithEmailOrPhoneButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                      ),
                      CustomWidget.spaceH(10),
                      CustomButtonWidget.alreadyAccountOrDont(
                        status: 'Already have an account?',
                        statusTextForButton: 'Sign In',
                        underline: true,
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      CustomWidget.spaceH(30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
