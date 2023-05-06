import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  final FlutterLocalNotificationsPlugin notificatioPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("flutter_logo");

    DarwinInitializationSettings initalizationIos =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestCriticalPermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});

    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initalizationIos);

    await notificatioPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: ((details) {}));
  }

  Future<void> simpleNotifactionShow() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channelId', 'channelName',
            priority: Priority.high,
            importance: Importance.max,
            channelShowBadge: true,
            icon: 'ic_launcher',
            largeIcon: DrawableResourceAndroidBitmap('ic_launcher'));
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificatioPlugin.show(
        0, 'simple notification', 'new user send message', notificationDetails);
  }
}
