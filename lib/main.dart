import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_hub_app/data/notification/firebase_notification.dart';
import 'package:food_hub_app/data/notification/local_notification.dart';
import 'package:food_hub_app/firebase_options.dart';
import 'package:food_hub_app/presentation/util/l10n/l10n.dart';
import 'package:food_hub_app/presentation/util/strings_config.dart';
import 'package:food_hub_app/presentation/view/home/food_hub_screen.dart';
import 'package:food_hub_app/presentation/view/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/view/phone_registration/phone_registration_screen.dart';
import 'package:food_hub_app/presentation/view/phone_registration/verification_screen.dart';
import 'package:food_hub_app/presentation/view/sign_up/verification_email_screen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:food_hub_app/presentation/view/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification().initNotifications();

  await EasyLocalization.ensureInitialized();

  LocalNotification.initialize(FlutterLocalNotificationsPlugin());

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: StringConfigs.translationPath,
        supportedLocales: L10n.all,
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
        '/verification_email': (context) => const VerificationEmailScreen(),
        '/sign_up_phone': (context) => const PhoneRegistrationScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const FoodHubScreen(),
      },
      initialRoute: '/',
      builder: EasyLoading.init(),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
