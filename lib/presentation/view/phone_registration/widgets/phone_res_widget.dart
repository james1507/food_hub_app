import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/strings_config.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_field_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PhoneResWidget {
  static List<String> listCountryCode = <String>['VN', 'KR', 'JP', 'US'];

  static final formPhoneLoginGroup = FormGroup({
    'phoneNumber': FormControl<String>(validators: [
      Validators.required,
      Validators.number,
      Validators.minLength(10),
    ]),
  });

  static Widget reactiveFormPhoneLogin({
    Key? key,
    TextEditingController? phoneController,
  }) {
    return ReactiveForm(
      key: key,
      formGroup: formPhoneLoginGroup,
      child: CustomTextFieldWidget.customPhoneReactiveTextField(
        formControlName: 'phoneNumber',
        controller: phoneController,
        validationMessages: StringConfigs.validationMessagesPhone,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  static Widget loginButtonWidget({required VoidCallback onPress}) {
    return Center(
      child: CustomButtonWidget.customButton(
        height: 60,
        width: 248,
        backgroundColor: AppColors.primaryColor,
        boderRadius: 30,
        onPress: onPress,
        widget: CustomTextWidget.textCustom(
            text: 'SEND', color: AppColors.primaryBackgroundColor),
      ),
    );
  }

  static Widget dropDownButton(
      {String? dropDownValue, required void Function(String?)? onChanged}) {
    return SizedBox(
      height: 50,
      child: DropdownButton(
        underline: Container(color: Colors.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        value: dropDownValue,
        elevation: 16,
        items: listCountryCode.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            alignment: Alignment.center,
            child: Flag.fromString(
              value,
              height: 50,
              width: 50,
              flagSize: FlagSize.size_4x3,
              borderRadius: 12,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
