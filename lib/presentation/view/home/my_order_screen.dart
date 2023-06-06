import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/view/home/widgets/drawer_menu_widget.dart';

class MyOrderPage extends StatelessWidget {
  final VoidCallback openDrawer;

  const MyOrderPage({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("MyOrder Page"),
        leading: DrawerMenuWidget(onClicked: openDrawer),
      ),
    );
  }
}
