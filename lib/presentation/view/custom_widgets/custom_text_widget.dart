import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextWidget {
  static Widget textCustom({
    String text = "",
    double fontSize = 14,
    Color color = AppColors.primaryColor,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sofia Pro',
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  static Widget titleName(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
      ),
      child: Text(
        text,
        style: CustomStyle.titlePrimary32(context),
      ),
    );
  }

  static Widget signInWith(BuildContext context,
      {Color colorLine = AppColors.primaryBackgroundColor,
      Color colorText = AppColors.primaryBackgroundColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomWidget.lineSignIn(colorLine.withOpacity(0.5)),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'shareTextSignInWith'.tr(),
            style: CustomStyle.customSignWith(context, color: colorText),
          ),
        ),
        CustomWidget.lineSignIn(colorLine.withOpacity(0.5)),
      ],
    );
  }
}
