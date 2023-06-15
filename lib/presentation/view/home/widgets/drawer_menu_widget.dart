import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/custom_style.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DrawerMenuWidget({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: CustomStyle.buttonOpenDrawerAppBar(),
        child: ImagePaths.appBarButtonImage,
      );
}
