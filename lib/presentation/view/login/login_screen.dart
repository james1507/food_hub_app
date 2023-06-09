import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/model/login_model.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/login/widgets/login_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginModel loginModel = const LoginModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

    loginModel = loginModel.copyWith(
        email: emailController.text, password: passwordController.text);

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
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
                context, AppLocalizations.of(context)!.signIn),
            CustomWidget.spaceH(31),
            LoginWidget.reactiveFormLogin(
              context,
              key: formKey,
              onPressed: () {
                setState(
                  () {
                    _passwordVisible = !_passwordVisible;
                  },
                );
              },
              isVisible: _passwordVisible,
              emailController: emailController,
              passwordController: passwordController,
            ),
            LoginWidget.loginButtonWidget(
              context,
              onPress: () {
                if (LoginWidget.formLoginGroup.valid == true) {
                  ref
                      .watch(authControllerProvider.notifier)
                      .loginWithEmailAndPassWord(loginModel, context);
                  
                } else {
                  CustomWidget.errorDialog(context,
                      errorString: "Please enter done input");
                }
              },
            ),
            CustomWidget.spaceH(20),
            LoginWidget.alreadyAccountQuestion(context),
            CustomWidget.spaceH(20),
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
}
