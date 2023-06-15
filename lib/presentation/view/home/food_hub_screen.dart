import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/controller/auth_phone_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/home/datas/drawer_item.dart';
import 'package:food_hub_app/presentation/view/home/home_screen.dart';
import 'package:food_hub_app/presentation/view/home/my_order_screen.dart';
import 'package:food_hub_app/presentation/view/home/settings_screen.dart';
import 'package:food_hub_app/presentation/view/home/widgets/drawer_widget.dart';
import 'package:food_hub_app/presentation/view/home/widgets/home_widgets.dart';
import 'package:food_hub_app/presentation/view/login/login_screen.dart';

class FoodHubScreen extends ConsumerStatefulWidget {
  const FoodHubScreen({super.key});
  static const route = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodHubScreenState();
}

class _FoodHubScreenState extends ConsumerState<FoodHubScreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItemModel itemChoose = DrawerItems().home;

  bool isDragging = false;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildDrawer(),
          buildHomePage(),
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();

          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen ? Colors.white12 : AppColors.primaryColor,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return SizedBox(
      width: 230,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: user?.photoURL == null
                          ? ImagePaths.bigAvatarHome
                          : Image.network(user?.photoURL ?? ""),
                    ),
                    Text(
                      user?.displayName ?? "Username",
                      style: const TextStyle(
                          fontFamily: 'Sofia Pro',
                          fontSize: 20,
                          color: AppColors.welcomeSubtitleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user?.email != null
                          ? user?.email ?? "Email"
                          : user?.phoneNumber ?? "Phone Number",
                      style: const TextStyle(
                        fontFamily: 'Sofia Pro',
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              DrawerWidget(
                onSelectItem: (item) {
                  if (item == DrawerItems().logout) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("drawerTextLogOut".tr())));
                    return;
                  } else {
                    setState(() {
                      itemChoose = item;
                      closeDrawer();
                    });
                  }
                },
              ),
              HomeWidgets().buttonLogoutHome(
                context,
                () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', ModalRoute.withName('/welcome'));

                  ref.read(authControllerProvider.notifier).logout();
                  ref.read(authPhoneControllerProvider.notifier).logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    if (itemChoose.title == DrawerItems().myOrder.title) {
      return MyOrderPage(openDrawer: openDrawer);
    } else if (itemChoose.title == DrawerItems().settings.title) {
      return SettingsScreen(openDrawer: openDrawer);
    } else {
      return HomeScreen(openDrawer: openDrawer);
    }
  }
}
