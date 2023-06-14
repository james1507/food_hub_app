import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/controller/auth_phone_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/view/home/datas/drawer_item.dart';
import 'package:food_hub_app/presentation/view/home/home_screen.dart';
import 'package:food_hub_app/presentation/view/home/my_order_screen.dart';
import 'package:food_hub_app/presentation/view/home/widgets/drawer_widget.dart';
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
  DrawerItemModel item = DrawerItems.home;
  DrawerItemModel itemLogout = DrawerItems.logout;
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
      body: Stack(
        children: [
          buildDrawer(),
          buildHomePage(),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return SizedBox(
      width: 230,
      child: SafeArea(
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
                        ? Image.asset(
                            "assets/images/home_screen_images/big_avatar.jpg",
                          )
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
                switch (item) {
                  case DrawerItems.logout:
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Log out")));
                    return;
                  default:
                    setState(() {
                      this.item = item;
                      closeDrawer();
                    });
                }
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                    AppColors.primaryColor,
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  minimumSize:
                      const MaterialStatePropertyAll<Size>(Size(100, 40)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ), ModalRoute.withName('/welcome'));
                  ref.read(authControllerProvider.notifier).logout();
                  ref.read(authPhoneControllerProvider.notifier).logout();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.power_settings_new_sharp,
                      color: AppColors.primaryTextColor,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      itemLogout.title,
                      style: const TextStyle(
                        fontFamily: 'Sofia Pro',
                        color: AppColors.primaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.myOrder:
        return MyOrderPage(openDrawer: openDrawer);
      case DrawerItems.home:
      default:
        return HomeScreen(openDrawer: openDrawer);
    }
  }
}
