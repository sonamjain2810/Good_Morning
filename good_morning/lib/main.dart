import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:good_morning/api/NotificationManager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'App_Theme.dart';
import 'HomePage.dart';
import 'utils/SizeConfig.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification;
  tz.initializeTimeZones();

  /*NotificationService().showNotification(
    title: "Good Morning Messages & Images",
    body: "It Works!",
  );*/

  NotificationService().scheduleNotification(
      title: 'Good Morning Messages & Images',
      body: 'Scheduled Notification',
      scheduleNotificationDateTime: DateTime.parse("2023-05-08 18:46"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final facebookAppEvents = FacebookAppEvents();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            title: 'App Name', // Replace your app name here
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      );
    });
  }
}
