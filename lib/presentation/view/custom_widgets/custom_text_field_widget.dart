import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextFieldWidget {
  static Widget customReactiveTextField({
    String titleTextField = "",
    String formControlName = "",
    TextEditingController? controller,
    String? Function(String?)? onChanged,
    Map<String, String Function(Object)>? validationMessages,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            titleTextField,
            style: CustomStyle.titleTextField,
          ),
        ),
        ReactiveTextField(
          formControlName: formControlName,
          decoration: CustomStyle.textFieldStyle,
          controller: controller,
          onChanged: (value) => onChanged,
          validationMessages: validationMessages,
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  static Widget customPhoneReactiveTextField({
    String titleTextField = "",
    String formControlName = "",
    TextEditingController? controller,
    String? Function(String?)? onChanged,
    Map<String, String Function(Object)>? validationMessages,
    TextInputType? keyboardType,
  }) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: CustomStyle.textFieldPhoneStyle,
      controller: controller,
      onChanged: (value) => onChanged,
      validationMessages: validationMessages,
      keyboardType: keyboardType,
    );
  }

  static Widget customReactivePassTextField({
    bool isVisible = false,
    String titleTextField = "",
    required VoidCallback onPressed,
    String formControlName = "",
    TextEditingController? controller,
    String? Function(String?)? onChanged,
    Map<String, String Function(Object)>? validationMessages,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            titleTextField,
            style: CustomStyle.titleTextField,
          ),
        ),
        ReactiveTextField(
          obscureText: !isVisible,
          formControlName: formControlName,
          decoration: CustomStyle.checkVisiblePass(
            onPressed: onPressed,
            isVisible: isVisible,
          ),
          controller: controller,
          validationMessages: validationMessages,
        ),
      ],
    );
  }
}
