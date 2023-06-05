import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';

class CustomButtonWidget {
  static Widget authSocialLoginButton(
      {required VoidCallback onPress,
      String text = "",
      required SvgPicture socialPic}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: CustomStyle.buttonAuthSocial,
          onPressed: onPress,
          child: Row(
            children: [
              socialPic,
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: CustomStyle.boldPrimary14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget alreadyAccountOrDont({
    String status = "",
    String statusTextForButton = "",
    required VoidCallback onPressed,
    Color color = AppColors.primaryBackgroundColor,
    Color colorButton = AppColors.primaryBackgroundColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status,
          style: CustomStyle.customAlready(color: color),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            statusTextForButton,
            style: CustomStyle.underlinePrimary16,
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
}
