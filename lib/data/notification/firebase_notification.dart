import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log("Title: ${message.notification?.title}");
  log("Body: ${message.notification?.body}");
  log("Payload: ${message.data}");
}

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    log("token: $fCMToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
