import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/strings_config.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_field_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginWidget {
  static final formLoginGroup = FormGroup({
    'email': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  static Widget reactiveFormLogin({
    Key? key,
    bool isVisible = false,
    required VoidCallback onPressed,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
        right: 24.99,
      ),
      child: ReactiveForm(
        key: key,
        formGroup: formLoginGroup,
        child: Column(
          children: [
            CustomTextFieldWidget.customReactiveTextField(
              titleTextField: "E-mail",
              formControlName: 'email',
              controller: emailController,
              validationMessages: StringConfigs.validationMessagesEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomWidget.spaceH(29),
            CustomTextFieldWidget.customReactivePassTextField(
              titleTextField: "Password",
              formControlName: 'password',
              controller: passwordController,
              onPressed: onPressed,
              isVisible: isVisible,
              validationMessages: StringConfigs.validationMessagesPassword,
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
