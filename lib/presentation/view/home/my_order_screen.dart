import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/view/home/widgets/home_widgets.dart';

class MyOrderPage extends ConsumerStatefulWidget {
  final VoidCallback openDrawer;

  const MyOrderPage({super.key, required this.openDrawer});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends ConsumerState<MyOrderPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          children: [
            HomeWidgets().appBarHomePage(widget.openDrawer, user!),
          ],
        ),
      ),
    );
  }
}
