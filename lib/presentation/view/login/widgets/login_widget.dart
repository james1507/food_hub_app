import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_field_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

class LoginWidget {
  static Widget formLogin({
    Key? key,
    required VoidCallback onPressed,
    bool isVisible = false,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    String? Function(String?)? validatorEmail,
    String? Function(String?)? validatorPassword,
    String? Function(String?)? onChangedEmail,
    String? Function(String?)? onChangedPassword,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
        right: 24.99,
      ),
      child: Form(
        key: key,
        child: Column(
          children: [
            CustomTextFieldWidget.customTextField(
              titleTextField: "E-mail",
              controller: emailController,
              validator: validatorEmail,
              onChanged: onChangedEmail,
            ),
            CustomWidget.spaceH(29),
            CustomTextFieldWidget.customPassTextField(
              titleTextField: "Password",
              onPressed: onPressed,
              isVisible: isVisible,
              controller: passwordController,
              validator: validatorPassword,
              onChanged: onChangedPassword,
            ),
          ],
        ),
      ),
    );
  }

  static Widget loginButtonWidget({required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        marginButton: const EdgeInsets.only(right: 27.5, top: 26),
        height: 60,
        width: 248,
        backgroundColor: AppColors.primaryColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'LOGIN', color: AppColors.primaryBackgroundColor),
      ),
    );
  }

  static Widget alreadyAccountQuestion(BuildContext context) {
    return CustomButtonWidget.alreadyAccountOrDont(
      status: 'Don’t have an account?',
      statusTextForButton: 'Sign Up',
      onPressed: () {
        Navigator.pushNamed(context, '/sign_up');
      },
      color: AppColors.primaryTitleColor,
      colorButton: AppColors.primaryColor,
    );
  }
}
