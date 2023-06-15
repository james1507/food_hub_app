import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/home/widgets/drawer_menu_widget.dart';

class HomeWidgets {
  Widget chooseLanguage(
      {TextEditingController? textEditingController,
      Function(String)? onChanged}) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 27.5, top: 30),
      height: 31,
      width: 250,
      child: CustomDropdown(
        borderRadius: BorderRadius.circular(30),
        items: const ['Việt nam', 'English'],
        controller: textEditingController!,
        onChanged: onChanged,
      ),
    );
  }

  Widget appBarHomePage(VoidCallback openDrawer, User user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerMenuWidget(onClicked: openDrawer),
            _buildChooseAddress(),
            SizedBox(
              height: 38,
              width: 38,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: user.photoURL == null
                    ? ImagePaths.avatarHome
                    : Image.network(user.photoURL ?? ""),
              ),
            ),
          ],
        ),
      ],
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
              ImagePaths.iconDownAppBarHome,
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

  Widget buttonLogoutHome(BuildContext context, Function()? onPressed) {
    return Container(
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
          minimumSize: const MaterialStatePropertyAll<Size>(Size(100, 40)),
        ),
        onPressed: onPressed,
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
              "drawerTextLogOut".tr(),
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
    );
  }

  Widget buttomBarWithWNoti(Widget widget, String notiTimes) {
    return Stack(
      children: [
        widget,
        Container(
          margin: const EdgeInsets.only(left: 18, bottom: 0),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: AppColors.notification,
            borderRadius: BorderRadius.circular(4),
          ),
          constraints: const BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: Text(
            notiTimes,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
