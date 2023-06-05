import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';

class WelcomeWidget {
  static Widget skipButtonWidget() {
    return CustomButtonWidget.customButton(
      marginButton: const EdgeInsets.only(right: 27.5, top: 26),
      height: 31,
      width: 55,
      backgroundColor: AppColors.primaryBackgroundColor,
      boderRadius: 20,
      onPress: () {},
      widget: CustomTextWidget.textCustom(text: 'Skip'),
    );
  }

  static Widget titleWelcome() {
    return Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Welcome to \n',
              style: CustomStyle.boldDark52,
            ),
            TextSpan(
              text: 'FoodHub \n',
              style: CustomStyle.boldPrimary52,
            ),
            TextSpan(
              text: 'Your favourite foods delivered\n',
              style: CustomStyle.boldPrimary18h2,
            ),
            TextSpan(
              text: 'fast at your door.',
              style: CustomStyle.boldPrimary18,
            ),
          ],
        ),
      ),
    );
  }

  static Widget startWithEmailOrPhoneButton({required VoidCallback onPressed}) {
    return OutlinedButton(
      style: CustomStyle.buttonStartEmailorPhone,
      onPressed: onPressed,
      child: const Text(
        "Start with email or phone",
        style: CustomStyle.buttonEorP16,
      ),
    );
  }
}
