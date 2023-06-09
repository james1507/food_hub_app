import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        if (FirebaseAuth.instance.currentUser?.phoneNumber == null) {
          Navigator.pushNamed(context, '/verification_email');
        } else {
          Navigator.pushNamed(context, '/home');
        }
      }
    }));
    return WillPopScope(
      onWillPop: () async {
        presscount++;

        if (presscount == 2) {
          exit(0);
        } else {
          Fluttertoast.showToast(
            msg: AppLocalizations.of(context)!.messageExit,
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
                  WelcomeWidget.skipButtonWidget(context),
                  WelcomeWidget.titleWelcome(context),
                  Column(
                    children: [
                      CustomTextWidget.signInWith(context,
                          colorLine: AppColors.primaryBackgroundColor),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: CustomStyle.buttonAuthSocial(context),
                                onPressed: () {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .loginWithGoogle(context);
                                },
                                child: Row(
                                  children: [
                                    ImagePaths.googleIcon,
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'GOOGLE',
                                      style: CustomStyle.boldPrimary14(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomWidget.spaceH(30),
                      WelcomeWidget.startWithEmailOrPhoneButton(
                        context,
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                      ),
                      CustomWidget.spaceH(10),
                      CustomButtonWidget.alreadyAccountOrDont(
                        context,
                        status: AppLocalizations.of(context)!.alreadyAccount,
                        statusTextForButton:
                            AppLocalizations.of(context)!.signIn,
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
