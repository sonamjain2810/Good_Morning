import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'App_Theme.dart';
import 'HomePage.dart';
import 'utils/SizeConfig.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
