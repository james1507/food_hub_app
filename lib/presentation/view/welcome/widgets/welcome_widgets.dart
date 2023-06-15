import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class WelcomeWidget {
  Widget skipButtonWidget(BuildContext context,
      {required VoidCallback onPress}) {
    return CustomButtonWidget.customButton(
      marginButton: const EdgeInsets.only(right: 27.5, top: 30),
      height: 31,
      width: 55,
      backgroundColor: AppColors.primaryBackgroundColor,
      boderRadius: 20,
      onPress: onPress,
      widget: CustomTextWidget.textCustom(text: 'welcomeButtonSkip'.tr()),
    );
  }

  Widget chooseLanguage(
      {TextEditingController? textEditingController,
      Function(String)? onChanged}) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 27.5, top: 30),
      height: 31,
      width: 100,
      child: CustomDropdown(
        borderRadius: BorderRadius.circular(30),
        items: const ['vn', 'en'],
        controller: textEditingController!,
        onChanged: onChanged,
      ),
    );
  }

  Widget titleWelcome(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'welcomeTextWelcomeTo'.tr(),
              style: CustomStyle.boldDark52(context),
            ),
            TextSpan(
              text: 'welcomeTextFoobHub'.tr(),
              style: CustomStyle.boldPrimary52(context),
            ),
            TextSpan(
              text: 'welcomeTextTitleWelcome1'.tr(),
              style: CustomStyle.boldPrimary18h2(context),
            ),
            TextSpan(
              text: 'welcomeTextTitleWelcome2'.tr(),
              style: CustomStyle.boldPrimary18(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget startWithEmailOrPhoneButton(BuildContext context,
      {required VoidCallback onPressed}) {
    return OutlinedButton(
      style: CustomStyle.buttonStartEmailorPhone(context),
      onPressed: onPressed,
      child: Text(
        'welcomeButtonStartWithEmailOrPhoneButton'.tr(),
        style: CustomStyle.buttonEorP16(context),
      ),
    );
  }
}
