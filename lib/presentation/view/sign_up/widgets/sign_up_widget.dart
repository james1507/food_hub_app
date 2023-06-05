import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_field_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

class SignUpWidget {
  static Widget formSignUp({
    required VoidCallback onPressed,
    bool isVisible = false,
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
        right: 24.99,
      ),
      child: Form(
        child: Column(
          children: [
            CustomTextFieldWidget.customTextField(
                titleTextField: "Full name", controller: fullNameController),
            CustomWidget.spaceH(29),
            CustomTextFieldWidget.customTextField(
                titleTextField: "E-mail", controller: emailController),
            CustomWidget.spaceH(29),
            CustomTextFieldWidget.customPassTextField(
                titleTextField: "Password",
                controller: passwordController,
                onPressed: onPressed,
                isVisible: isVisible),
          ],
        ),
      ),
    );
  }

  static Widget signUpButtonWidget({required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        marginButton: const EdgeInsets.only(right: 27.5, top: 26),
        height: 60,
        width: 248,
        backgroundColor: AppColors.primaryColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'SIGN UP', color: AppColors.primaryBackgroundColor),
      ),
    );
  }

  static Widget alreadyAccountQuestion({required VoidCallback onPressed}) {
    return CustomButtonWidget.alreadyAccountOrDont(
      status: 'Already have an account?',
      statusTextForButton: 'Login',
      onPressed: onPressed,
      color: AppColors.primaryTitleColor,
      colorButton: AppColors.primaryColor,
    );
  }
}
