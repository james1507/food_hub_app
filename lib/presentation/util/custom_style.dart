import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:food_hub_app/presentation/util/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomStyle {
  static final fontApp = 'shareFontApp'.tr();

  static TextStyle boldDark52(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        fontSize: 52,
        color: AppColors.primaryTitleColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle boldPrimary52(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        fontSize: 52,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle boldPrimary18h2(BuildContext context) => TextStyle(
        height: 2,
        fontFamily: fontApp,
        fontSize: 18,
        color: AppColors.welcomeSubtitleColor,
      );
  static TextStyle boldPrimary18(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        fontSize: 18,
        color: AppColors.welcomeSubtitleColor,
      );

  static TextStyle boldPrimary14(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        color: AppColors.primaryTitleColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle customSignWith(BuildContext context,
      {Color color = AppColors.primaryTextColor}) {
    return TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: color,
    );
  }

  static TextStyle customAlready(BuildContext context,
      {Color color = AppColors.primaryTextColor}) {
    return TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: color,
    );
  }

  static TextStyle underlinePrimary16(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        color: AppColors.primaryBackgroundColor,
        fontSize: 16,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryBackgroundColor,
        decorationThickness: 2,
      );

  static TextStyle buttonEorP16(BuildContext context) =>
      TextStyle(fontFamily: fontApp, fontSize: 16);

  static TextStyle titlePrimary32(BuildContext context) => TextStyle(
        fontSize: 32,
        fontFamily: fontApp,
        color: AppColors.primaryTitleColor,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      );

  static TextStyle titleTextField(BuildContext context) => TextStyle(
        fontFamily: fontApp,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.titleTextFieldColor,
      );

  // Button Style

  static ButtonStyle buttonAuthSocial(BuildContext context) => ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 15)),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          AppColors.primaryBackgroundColor,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        fixedSize: const MaterialStatePropertyAll<Size>(Size(140, 54)),
      );

  static ButtonStyle buttonStartEmailorPhone(BuildContext context) =>
      ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
        backgroundColor:
            MaterialStatePropertyAll<Color>(Colors.white.withOpacity(0.21)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        minimumSize: const MaterialStatePropertyAll<Size>(Size(300, 54)),
        side: const MaterialStatePropertyAll<BorderSide>(
            BorderSide(color: Colors.white, width: 1)),
      );

  static ButtonStyle skipButton(Color backgroundColor, double boderRadius) {
    return ButtonStyle(
      alignment: Alignment.center,
      padding: const MaterialStatePropertyAll(EdgeInsets.only(bottom: 4)),
      backgroundColor: MaterialStatePropertyAll<Color>(
        backgroundColor,
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(boderRadius),
        ),
      ),
    );
  }

  static ButtonStyle backButton(BuildContext context) => ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 5)),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          AppColors.primaryBackgroundColor,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      );

  // Gradian Style

  static Gradient gradientWelcome = LinearGradient(
    colors: [
      const Color(0xFF5C4963).withOpacity(0.1),
      const Color(0xFF191B2F),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
  );

  // Text Form Field Style

  static InputDecoration textFieldStyle(BuildContext context) =>
      const InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.borderOffTextFieldColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );

  static InputDecoration textFieldPhoneStyle(BuildContext context) =>
      const InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.borderOffTextFieldColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.borderOffTextFieldColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.borderOffTextFieldColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );

  static InputDecoration checkVisiblePass(
      {bool isVisible = false, required VoidCallback onPressed}) {
    return InputDecoration(
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: isVisible
            ? const Icon(Icons.visibility_off,
                color: AppColors.hidePasswordColor)
            : const Icon(Icons.visibility, color: AppColors.hidePasswordColor),
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.borderOffTextFieldColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
