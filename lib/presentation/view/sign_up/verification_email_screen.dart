import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/home/food_hub_screen.dart';
import 'package:food_hub_app/presentation/view/login/widgets/login_widget.dart';
import 'package:food_hub_app/presentation/view/sign_up/widgets/sign_up_widget.dart';

class VerificationEmailScreen extends ConsumerStatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState
    extends ConsumerState<VerificationEmailScreen> {
  String phoneLogin = "";
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    LoginWidget.formLoginGroup.reset();

    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

    phoneLogin = FirebaseAuth.instance.currentUser?.phoneNumber ?? "";

    if (!isEmailVerified) {
      // sendVerificationEmail();

      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
  }

  // sendVerificationEmail() async {

  //   setState(() => canResendEmail = false);
  //   await Future.delayed(const Duration(seconds: 5));
  //   setState(() => canResendEmail = true);
  // }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified =
          FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return phoneLogin != ""
        ? const FoodHubScreen()
        : isEmailVerified
            ? const FoodHubScreen()
            : WillPopScope(
                onWillPop: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', ModalRoute.withName('/welcome'));
                  ref.read(authControllerProvider.notifier).setState(false);
                  return Future.value(false);
                },
                child: Scaffold(
                  backgroundColor: AppColors.primaryBackgroundColor,
                  body: LayoutBuilder(
                    builder: (context, constrains) => SingleChildScrollView(
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CustomWidget.topImage(context),
                                CustomButtonWidget.backButton(
                                  context,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            CustomWidget.spaceH(100),
                            CustomTextWidget.titleName(
                              context,
                              'shareTextVerificationEmail'.tr(),
                            ),
                            CustomWidget.spaceH(15),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'signUpTitleVerificationEmail'
                                          .tr(args: [user?.email ?? ""]),
                                      style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        fontSize: 14,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    CustomWidget.spaceH(38),
                                    SignUpWidget.resendButtonWidget(context,
                                        onPress: () {}),
                                    CustomWidget.spaceH(38),
                                    SignUpWidget.cancelButton(context,
                                        onPress: () {
                                      FirebaseAuth.instance.signOut();
                                      ref
                                          .read(authControllerProvider.notifier)
                                          .logout();
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/login',
                                        ModalRoute.withName('/welcome'),
                                      );
                                    }),
                                  ],
                                ),
                              ),
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
