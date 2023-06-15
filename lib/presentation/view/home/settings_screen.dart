import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/view/home/widgets/home_widgets.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  final VoidCallback openDrawer;
  const SettingsScreen({super.key, required this.openDrawer});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final languageChoose = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          children: [
            HomeWidgets().appBarHomePage(widget.openDrawer, user!),
            HomeWidgets().chooseLanguage(
                textEditingController: languageChoose,
                onChanged: (lang) {
                  if (lang == 'Việt nam') {
                    context.setLocale(const Locale('vi'));
                  } else if (lang == 'English') {
                    context.setLocale(const Locale('en'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
