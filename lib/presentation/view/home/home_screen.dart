import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/home/datas/food_item.dart';
import 'package:food_hub_app/presentation/view/home/widgets/drawer_menu_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback openDrawer;

  const HomeScreen({super.key, required this.openDrawer});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DrawerMenuWidget(onClicked: widget.openDrawer),
                  _buildChooseAddress(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/home_screen_images/app_bar_avatar.png",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "What would you like\nto order",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              _buildFindFoodAndFilter(),
              const SizedBox(
                height: 25,
              ),
              CategoriesWidget(
                isClick: isClick,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Restaurants",
                    style: TextStyle(
                        fontFamily: 'Sofia Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(AppColors.primaryColor)),
                    onPressed: () {},
                    child: const Text(
                      "View All >",
                      style: TextStyle(fontFamily: 'Sofia Pro'),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  _featuredRestaurants(),
                  _featuredRestaurants(),
                  _featuredRestaurants(),
                  _featuredRestaurants(),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon1_off.svg"),
            activeIcon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon1_on.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon2_off.svg"),
            activeIcon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon2_on.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgPicture.asset(
                    "assets/images/home_screen_images/bottom_icons/icon3_off.svg"),
                Container(
                  margin: const EdgeInsets.only(left: 18, bottom: 15),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.notification,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            activeIcon: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: SvgPicture.asset(
                      "assets/images/home_screen_images/bottom_icons/icon3_on.svg"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 18, bottom: 15),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.notification,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon4_off.svg"),
            activeIcon: SvgPicture.asset(
                "assets/images/home_screen_images/bottom_icons/icon4_on.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgPicture.asset(
                    "assets/images/home_screen_images/bottom_icons/icon5_off.svg"),
                Container(
                  margin: const EdgeInsets.only(left: 18, bottom: 15),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.notification,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            activeIcon: Stack(
              children: [
                SvgPicture.asset(
                    "assets/images/home_screen_images/bottom_icons/icon5_on.svg"),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.notification,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildChooseAddress() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Deliver to",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                  "assets/images/home_screen_images/icon_down.svg"),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "4102 Pretty View Lane",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFindFoodAndFilter() {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildFindFood()),
        const SizedBox(
          width: 30,
        ),
        Expanded(flex: 1, child: _buildFilter()),
      ],
    );
  }

  Widget _buildFindFood() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.textColor.withOpacity(0.3),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          hintText: "Find for food or restaurant..."),
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Sofia Pro',
      ),
    );
  }

  Widget _buildFilter() {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.primaryBackgroundColor,
        ),
        minimumSize: MaterialStatePropertyAll(Size(0, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
      child: SvgPicture.asset(
        "assets/images/home_screen_images/filter_icon.svg",
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _featuredRestaurants() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        color: AppColors.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/home_screen_images/feature_images/feature1.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "4.5",
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1, left: 5),
                          child: Image.asset(
                            "assets/images/home_screen_images/feature_images/star_icon.jpg",
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 5),
                          child: Text("(25+)",
                              style: TextStyle(
                                fontFamily: 'Sofia Pro',
                                fontSize: 10,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/images/home_screen_images/feature_images/heart.jpg",
                      height: 15,
                      fit: BoxFit.fill,
                      color: AppColors.primaryBackgroundColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  "McDonald's",
                  style: TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/home_screen_images/feature_images/vefifi_icon.jpg",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: Image.asset(
                    "assets/images/home_screen_images/feature_images/delivery_icon.jpg",
                  ),
                ),
                const Text(
                  "Free delivery",
                  style: TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  child: Image.asset(
                    "assets/images/home_screen_images/feature_images/time_icon.jpg",
                  ),
                ),
                const Text(
                  "10-15 mins",
                  style: TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: AppColors.textColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "BURGER",
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: AppColors.textColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "CHICKEN",
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: AppColors.textColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "FAST FOOD",
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  late bool isClick;

  CategoriesWidget({super.key, required this.isClick});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<bool> listClick = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: FoodItems.all
            .map((item) => Row(
                  children: [
                    SizedBox(
                        width: 70,
                        height: 120,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              item.isClick
                                  ? AppColors.primaryColor
                                  : AppColors.primaryBackgroundColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.only(left: 5, right: 5, top: 5),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              item.isClick = widget.isClick;
                              widget.isClick = !widget.isClick;
                            });
                          },
                          child: _buildfoodCategory(
                              item.icon, item.title, item.isClick),
                        )),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _buildfoodCategory(String image, String title, bool isClick) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(title,
            style: TextStyle(
                fontSize: 12,
                color: isClick
                    ? AppColors.primaryBackgroundColor
                    : AppColors.textColor1)),
      ],
    );
  }
}
