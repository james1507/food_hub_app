import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DrawerMenuWidget({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primaryBackgroundColor,
          ),
          minimumSize: MaterialStatePropertyAll(Size(30, 45)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        child: SvgPicture.asset(
          "assets/images/home_screen_images/app_bar_icon_1.svg",
          color: AppColors.appBarButtonColor,
        ),
      );
}
