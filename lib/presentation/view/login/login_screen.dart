import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/model/login_model.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/controller/login_controller.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/login/widgets/login_widget.dart';

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
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, ((previous, next) {
      if (next == true) {
        Navigator.pushNamed(context, '/home');
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
            CustomWidget.topImage(context),
            CustomWidget.spaceH(100),
            CustomTextWidget.titleName("Login"),
            CustomWidget.spaceH(31),
            LoginWidget.reactiveFormLogin(
              ref: ref,
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
              onPress: () {
                ref
                    .watch(loginControllerProvider.notifier)
                    .loginWithEmailAndPassWord(loginModel, context);
              },
            ),
            CustomWidget.spaceH(20),
            LoginWidget.alreadyAccountQuestion(context),
            CustomWidget.spaceH(20),
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
            CustomWidget.spaceH(20),
          ],
        ),
      ),
    );
  }
}
