class DrawerItemModel {
  final String title;
  // final IconData icon;
  final String icon;

  const DrawerItemModel({required this.title, required this.icon});
}

class DrawerItems {
  static const home = DrawerItemModel(
      title: 'My Order',
      icon: "assets/images/home_screen_images/drawer_icons/drawer1.svg");
  static const myOrder = DrawerItemModel(
      title: 'My Profile',
      icon: "assets/images/home_screen_images/drawer_icons/drawer2.svg");
  static const deliveryAddress = DrawerItemModel(
      title: 'Delivery Address',
      icon: "assets/images/home_screen_images/drawer_icons/drawer3.svg");
  static const paymentMethods = DrawerItemModel(
      title: 'Payment Methods',
      icon: "assets/images/home_screen_images/drawer_icons/drawer4.svg");
  static const contactUs = DrawerItemModel(
      title: 'Contant Us',
      icon: "assets/images/home_screen_images/drawer_icons/drawer5.svg");
  static const settings = DrawerItemModel(
      title: 'Settings',
      icon: "assets/images/home_screen_images/drawer_icons/drawer6.svg");
  static const helpsAndFAQs = DrawerItemModel(
      title: 'Helps & FAQs',
      icon: "assets/images/home_screen_images/drawer_icons/drawer7.svg");
  static const logout = DrawerItemModel(
      title: 'Log Out',
      icon: "assets/images/home_screen_images/drawer_icons/drawer8.svg");

  static final List<DrawerItemModel> all = [
    home,
    myOrder,
    deliveryAddress,
    paymentMethods,
    contactUs,
    settings,
    helpsAndFAQs,
  ];
}
