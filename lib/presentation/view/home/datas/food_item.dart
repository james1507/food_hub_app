class FoodItemModel {
  final String title;
  // final IconData icon;
  final String icon;
  late bool isClick;

  FoodItemModel(
      {required this.title, required this.icon, required this.isClick});
}

class FoodItems {
  static var burger = FoodItemModel(
    title: 'Burger',
    icon: "assets/images/home_screen_images/food_icons/food1.jpg",
    isClick: true,
  );
  static var donat = FoodItemModel(
    title: 'Donat',
    icon: "assets/images/home_screen_images/food_icons/food1.jpg",
    isClick: false,
  );
  static var pizza = FoodItemModel(
      title: 'Pizza',
      icon: "assets/images/home_screen_images/food_icons/food1.jpg",
      isClick: false);
  static var mexican = FoodItemModel(
    title: 'Mexican',
    icon: "assets/images/home_screen_images/food_icons/food1.jpg",
    isClick: false,
  );
  static var asian = FoodItemModel(
    title: 'Asian',
    icon: "assets/images/home_screen_images/food_icons/food1.jpg",
    isClick: false,
  );
  static var orther = FoodItemModel(
    title: 'Orther',
    icon: "assets/images/home_screen_images/food_icons/food1.jpg",
    isClick: false,
  );

  static List<FoodItemModel> all = [
    burger,
    donat,
    pizza,
    mexican,
    asian,
    orther,
  ];
}
