import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/firebase_options.dart';
import 'package:food_hub_app/presentation/view/home/food_hub_screen.dart';
import 'package:food_hub_app/presentation/view/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/view/phone_registration/phone_registration_screen.dart';
import 'package:food_hub_app/presentation/view/phone_registration/verification_screen.dart';

import 'package:food_hub_app/presentation/view/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/sign_up': (context) => const SignUpScreen(),
        '/sign_up_phone': (context) => const PhoneRegistrationScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const FoodHubScreen(),
      },
      initialRoute: '/',
      builder: EasyLoading.init(),
    );
  }
}
