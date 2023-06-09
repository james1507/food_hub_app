import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeWidget {
  static Widget skipButtonWidget(BuildContext context) {
    return CustomButtonWidget.customButton(
      marginButton: const EdgeInsets.only(right: 27.5, top: 26),
      height: 31,
      width: 55,
      backgroundColor: AppColors.primaryBackgroundColor,
      boderRadius: 20,
      onPress: () {},
      widget:
          CustomTextWidget.textCustom(text: AppLocalizations.of(context)!.skip),
    );
  }

  static Widget titleWelcome(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)?.welcomeTo,
              style: CustomStyle.boldDark52(context),
            ),
            TextSpan(
              text: AppLocalizations.of(context)?.foobHub,
              style: CustomStyle.boldPrimary52(context),
            ),
            TextSpan(
              text: AppLocalizations.of(context)?.titleWelcome1,
              style: CustomStyle.boldPrimary18h2(context),
            ),
            TextSpan(
              text: AppLocalizations.of(context)?.titleWelcome2,
              style: CustomStyle.boldPrimary18(context),
            ),
          ],
        ),
      ),
    );
  }

  static Widget startWithEmailOrPhoneButton(BuildContext context,
      {required VoidCallback onPressed}) {
    return OutlinedButton(
      style: CustomStyle.buttonStartEmailorPhone(context),
      onPressed: onPressed,
      child: Text(
        AppLocalizations.of(context)!.startWithEmailOrPhoneButton,
        style: CustomStyle.buttonEorP16(context),
      ),
    );
  }
}
