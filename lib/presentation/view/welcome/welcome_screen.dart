import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/data/auth_data/auth_service.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/controller/login_controller.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/welcome/widgets/welcome_widgets.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  String userid = "";
  String username = "";

  AuthServiceImpl authServiceImpl = AuthServiceImpl();

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, ((previous, next) {
      if (next == true) {
        Navigator.pushNamed(context, '/home');
      }
    }));
    return Scaffold(
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
                                .read(loginControllerProvider.notifier)
                                .loginWithFacebook(context);
                          },
                          socialPic: ImagePaths.facebookIcon,
                          text: 'FACEBOOK',
                        ),
                        CustomWidget.spaceW(20),
                        CustomButtonWidget.authSocialLoginButton(
                          onPress: () {
                            ref
                                .read(loginControllerProvider.notifier)
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
    );
  }
}
