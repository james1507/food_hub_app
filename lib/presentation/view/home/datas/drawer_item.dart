import 'package:easy_localization/easy_localization.dart';

class DrawerItemModel {
  final String title;
  final String icon;

  DrawerItemModel({required this.title, required this.icon});
}

class DrawerItems {
  var home = DrawerItemModel(
      title: 'drawerTextHome'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer1.svg");
  var myOrder = DrawerItemModel(
      title: 'drawerTextMyOrder'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer2.svg");
  var myProfile = DrawerItemModel(
      title: 'drawerTextMyProFile'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer1.svg");
  var deliveryAddress = DrawerItemModel(
      title: 'drawerTextDeliveryAddress'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer3.svg");
  var paymentMethods = DrawerItemModel(
      title: 'drawerTextPaymentMethods'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer4.svg");
  var contactUs = DrawerItemModel(
      title: 'drawerTextContactUs'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer5.svg");
  var settings = DrawerItemModel(
      title: 'drawerTextSettings'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer6.svg");
  var helpsAndFAQs = DrawerItemModel(
      title: 'drawerTextHelpsAndFAQs'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer7.svg");
  var logout = DrawerItemModel(
      title: 'drawerTextLogOut'.tr(),
      icon: "assets/images/home_screen_images/drawer_icons/drawer8.svg");

  List<DrawerItemModel> all() {
    return [
      home,
      myOrder,
      myProfile,
      deliveryAddress,
      paymentMethods,
      contactUs,
      settings,
      helpsAndFAQs,
    ];
  }
}
