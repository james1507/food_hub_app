import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/util/util.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser?.uid == null) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Navigator.pushNamed(context, '/welcome'));
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Navigator.pushNamed(context, '/verification_email'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: ImagePaths.splashLogo,
      ),
    );
  }
}
