import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/strings_config.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_field_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpWidget {
  static final formLoginGroup = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  static Widget reactiveFormSignUp(
    BuildContext context, {
    Key? key,
    bool isVisible = false,
    required VoidCallback onPressed,
    TextEditingController? fullNameController,
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
              context,
              titleTextField: 'signupTextFullName'.tr(),
              formControlName: 'name',
              controller: fullNameController,
              validationMessages: StringConfigs.validationMessagesName(context),
            ),
            CustomTextFieldWidget.customReactiveTextField(
              context,
              titleTextField: 'shareTextEmail'.tr(),
              formControlName: 'email',
              controller: emailController,
              validationMessages:
                  StringConfigs.validationMessagesEmail(context),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomWidget.spaceH(29),
            CustomTextFieldWidget.customReactivePassTextField(
              context,
              titleTextField: 'shareTextPassword'.tr(),
              formControlName: 'password',
              controller: passwordController,
              onPressed: onPressed,
              isVisible: isVisible,
              validationMessages:
                  StringConfigs.validationMessagesPassword(context),
            ),
          ],
        ),
      ),
    );
  }

  static Widget signUpButtonWidget(BuildContext context,
      {required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        marginButton: const EdgeInsets.only(right: 27.5, top: 26),
        height: 60,
        width: 248,
        backgroundColor: AppColors.primaryColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'shareTextSignUpUpper'.tr(),
            color: AppColors.primaryBackgroundColor),
      ),
    );
  }

  static Widget alreadyAccountQuestion(BuildContext context,
      {required VoidCallback onPressed}) {
    return CustomButtonWidget.alreadyAccountOrDont(
      context,
      status: 'shareTextAlreadyAccount'.tr(),
      statusTextForButton: 'shareTextSignIn'.tr(),
      onPressed: onPressed,
      color: AppColors.primaryTitleColor,
      colorButton: AppColors.primaryColor,
    );
  }

  static Widget signUpWithPhoneNumber(BuildContext context,
      {required VoidCallback onPressed}) {
    return CustomButtonWidget.alreadyAccountOrDont(
      context,
      status: 'signUpTextSignUpWithPhone'.tr(),
      statusTextForButton: 'signUpTextClickHere'.tr(),
      onPressed: onPressed,
      color: AppColors.primaryTitleColor,
      colorButton: AppColors.primaryColor,
    );
  }

  static Widget resendButtonWidget(BuildContext context,
      {required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        height: 60,
        width: 248,
        marginButton: const EdgeInsets.only(
          right: 30,
        ),
        backgroundColor: AppColors.primaryColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'signUpTextResendEmail'.tr(),
            color: AppColors.primaryBackgroundColor),
      ),
    );
  }

  static Widget cancelButton(BuildContext context,
      {required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        height: 40,
        width: 100,
        marginButton: const EdgeInsets.only(
          right: 30,
        ),
        backgroundColor: AppColors.primaryBackgroundColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'signUpTextCancelUpper'.tr(), color: AppColors.primaryColor),
      ),
    );
  }
}
