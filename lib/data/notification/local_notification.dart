import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const androidInitialize = AndroidInitializationSettings('app_icon');
    const initializationSettings =
        InitializationSettings(android: androidInitialize);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification(
      {var id = 0,
      String? title,
      String? body,
      String? payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('push_1', 'push_1',
            importance: Importance.max, priority: Priority.max);

    final noti = NotificationDetails(
        android: androidNotificationDetails,
        iOS: const DarwinNotificationDetails());

    await fln.show(id, title, body, noti);
  }
}
