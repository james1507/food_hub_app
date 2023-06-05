import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';

class CustomTextFieldWidget {
  static Widget customTextField({
    String titleTextField = "",
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? Function(String?)? onChanged,
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
        TextFormField(
          decoration: CustomStyle.textFieldStyle,
          controller: controller,
          validator: validator,
          onChanged: (value) => onChanged,
        )
      ],
    );
  }

  static Widget customPassTextField({
    String titleTextField = "",
    required VoidCallback onPressed,
    bool isVisible = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ),
          child: Text(
            titleTextField,
            style: CustomStyle.titleTextField,
          ),
        ),
        TextFormField(
          obscureText: !isVisible,
          decoration: CustomStyle.checkVisiblePass(
            onPressed: onPressed,
            isVisible: isVisible,
          ),
          controller: controller,
          validator: validator,
          onChanged: onChanged,
        )
      ],
    );
  }
}
