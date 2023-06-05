import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ImagePaths {
  static SvgPicture splashLogo =
      SvgPicture.asset("assets/images/splash_images/splash_logo.svg");
  static ImageProvider backgroundImage =
      const AssetImage("assets/images/welcome_images/background_image.png");
  static SvgPicture facebookIcon = SvgPicture.asset(
    "assets/images/welcome_images/facebook_icon.svg",
    height: 30,
    width: 30,
  );
  static SvgPicture googleIcon = SvgPicture.asset(
    "assets/images/welcome_images/google_icon.svg",
    height: 30,
    width: 30,
  );
  static ImageProvider topImage =
      const AssetImage("assets/images/sign_up_images/top_image.png");
}
