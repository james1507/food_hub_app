

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';

class CustomButtonWidget {
  static Widget authSocialLoginButton(BuildContext context,
      {required VoidCallback onPress,
      String text = "",
      required SvgPicture socialPic}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: CustomStyle.buttonAuthSocial(context),
          onPressed: onPress,
          child: Row(
            children: [
              socialPic,
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: CustomStyle.boldPrimary14(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget alreadyAccountOrDont(BuildContext context,
      {String status = "",
      String statusTextForButton = "",
      required VoidCallback onPressed,
      Color color = AppColors.primaryBackgroundColor,
      Color colorButton = AppColors.primaryBackgroundColor,
      bool underline = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status,
          style: CustomStyle.customAlready(context, color: color),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            statusTextForButton,
            style: underline
                ? CustomStyle.underlinePrimary16(context)
                : CustomStyle.customAlready(context, color: colorButton),
          ),
        ),
      ],
    );
  }

  static Widget customButton({
    EdgeInsetsGeometry marginButton =
        const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
    double height = 0.0,
    double width = 0.0,
    Color backgroundColor = Colors.white,
    double boderRadius = 0.0,
    required VoidCallback onPress,
    required Widget widget,
  }) {
    return Container(
      margin: marginButton,
      height: height,
      width: width,
      child: ElevatedButton(
        style: CustomStyle.skipButton(backgroundColor, boderRadius),
        onPressed: onPress,
        child: widget,
      ),
    );
  }

  static Widget backButton(BuildContext context,
      {required VoidCallback onPressed}) {
    return Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(
        left: 20,
        top: 35,
      ),
      child: ElevatedButton(
        style: CustomStyle.backButton(context),
        onPressed: onPressed,
        child: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.textColor1,
          size: 16,
        ),
      ),
    );
  }
}
