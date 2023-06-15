import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/util.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/home/datas/bottom_navigator_bar_item.dart';
import 'package:food_hub_app/presentation/view/home/datas/feature_item.dart';
import 'package:food_hub_app/presentation/view/home/widgets/category_widget.dart';

import 'package:food_hub_app/presentation/view/home/widgets/feature_restaurant.dart';
import 'package:food_hub_app/presentation/view/home/widgets/home_widgets.dart';
import 'package:food_hub_app/presentation/view/login/widgets/login_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback openDrawer;

  const HomeScreen({super.key, required this.openDrawer});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  var presscount = 0;

  User? user = FirebaseAuth.instance.currentUser;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isClick = true;

  @override
  void initState() {
    LoginWidget.formLoginGroup.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        presscount++;

        Future.delayed(
          const Duration(seconds: 4),
          () => presscount = 0,
        );

        if (presscount == 2) {
          exit(0);
        } else {
          Fluttertoast.showToast(
            msg: 'shareDialogMessageExit'.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.primaryBackgroundColor,
            textColor: AppColors.primaryTitleColor,
            fontSize: 16.0,
          );

          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeWidgets().appBarHomePage(widget.openDrawer, user!),
                CustomWidget.spaceH(25),
                Text(
                  "homeTextTitle".tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                CustomWidget.spaceH(25),
                _buildFindFoodAndFilter(),
                CustomWidget.spaceH(25),
                const CategoriesWidget(),
                CustomWidget.spaceH(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "homeTextFeatureRes".tr(),
                      style: const TextStyle(
                          fontFamily: 'Sofia Pro',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(AppColors.primaryColor)),
                      onPressed: () {},
                      child: Text(
                        "homeTextViewAll".tr(),
                        style: const TextStyle(fontFamily: 'Sofia Pro'),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      FeatureItems.all.length,
                      (index) => FeatureRestaurantWidget(
                        featureItemModel: FeatureItems.all[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: BottomNatigatorItems().all(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildFindFoodAndFilter() {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildFindFood()),
        CustomWidget.spaceW(20),
        Expanded(flex: 1, child: _buildFilter()),
      ],
    );
  }

  Widget _buildFindFood() {
    return TextField(
      decoration: CustomStyle().textSearchHome,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Sofia Pro',
      ),
    );
  }

  Widget _buildFilter() {
    return ElevatedButton(
      onPressed: () {},
      style: CustomStyle.buttonFilterHome,
      child: ImagePaths.filterHome,
    );
  }
}
