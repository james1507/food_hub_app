import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';

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

  static Widget titleName(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26,
      ),
      child: Text(
        text,
        style: CustomStyle.titlePrimary32,
      ),
    );
  }

  static Widget signInWith(
      {Color colorLine = AppColors.primaryBackgroundColor,
      Color colorText = AppColors.primaryBackgroundColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomWidget.lineSignIn(colorLine.withOpacity(0.5)),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "sign in with",
            style: CustomStyle.customSignWith(color: colorText),
          ),
        ),
        CustomWidget.lineSignIn(colorLine.withOpacity(0.5)),
      ],
    );
  }
}
