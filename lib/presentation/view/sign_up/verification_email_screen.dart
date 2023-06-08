import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/home/food_hub_screen.dart';
import 'package:food_hub_app/presentation/view/sign_up/widgets/sign_up_widget.dart';

class VerificationEmailScreen extends ConsumerStatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState
    extends ConsumerState<VerificationEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

    if (!isEmailVerified) {
      // sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
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

    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const FoodHubScreen()
        : Scaffold(
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
                            onPressed: () {},
                          ),
                        ],
                      ),
                      CustomWidget.spaceH(100),
                      CustomTextWidget.titleName("Verification Email"),
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
                                "A verification email has been sent to your email ${user}",
                                style: const TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 14,
                                  color: AppColors.textColor,
                                ),
                              ),
                              CustomWidget.spaceH(38),
                              SignUpWidget.resendButtonWidget(onPress: () {}),
                              CustomWidget.spaceH(38),
                              SignUpWidget.cancelButton(onPress: () {
                                FirebaseAuth.instance.signOut();
                                ref
                                    .read(authControllerProvider.notifier)
                                    .logout();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/sign_up',
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
          );
  }
}
