import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';

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

  static SvgPicture appBarButtonImage = SvgPicture.asset(
    "assets/images/home_screen_images/app_bar_icon_1.svg",
    color: AppColors.appBarButtonColor,
    width: 12,
    height: 6,
  );

  static Image heartIconFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/heart.jpg",
    height: 15,
    fit: BoxFit.fill,
    color: AppColors.primaryBackgroundColor,
  );

  static Image starIconFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/star_icon.jpg",
  );

  static Image backgroundImageFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/feature1.jpg",
    fit: BoxFit.fill,
  );

  static Image verifyIconFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/vefifi_icon.jpg",
  );

  static Image deliveryIconFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/delivery_icon.jpg",
  );

  static Image timeIconFeature = Image.asset(
    "assets/images/home_screen_images/feature_images/time_icon.jpg",
  );

  static SvgPicture iconHomeOff = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon1_off.svg");

  static SvgPicture iconHomeOn = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon1_on.svg");

  static SvgPicture iconLocationOff = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon2_off.svg");

  static SvgPicture iconLocationOn = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon2_on.svg");

  static SvgPicture iconCartOff = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon3_off.svg");

  static SvgPicture iconCartOn = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon3_on.svg");

  static SvgPicture iconLikeOff = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon4_off.svg");

  static SvgPicture iconLikeOn = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon4_on.svg");

  static SvgPicture iconNotificationOff = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon5_off.svg");

  static SvgPicture iconNotificationOn = SvgPicture.asset(
      "assets/images/home_screen_images/bottom_icons/icon5_on.svg");

  static Image avatarHome = Image.asset(
    "assets/images/home_screen_images/app_bar_avatar.png",
  );

  static Image bigAvatarHome = Image.asset(
    "assets/images/home_screen_images/big_avatar.jpg",
  );

  static SvgPicture filterHome = SvgPicture.asset(
    "assets/images/home_screen_images/filter_icon.svg",
    color: AppColors.primaryColor,
  );

  static SvgPicture iconDownAppBarHome =
      SvgPicture.asset("assets/images/home_screen_images/icon_down.svg");
}
