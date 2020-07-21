import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sand_box/config/app_config.dart';
import 'package:sand_box/screens/page_home.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.appConfig, this.flutterLocalNotificationsPlugin);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final AppConfig appConfig;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appConfig.themeData,
      initialRoute: '/',
      navigatorObservers: appConfig.useAnalytics
          ? [FirebaseAnalyticsObserver(analytics: appConfig.firebaseAnalytics)]
          : [],
      routes: {},
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        analytics: appConfig.firebaseAnalyticsCore,
      ),
    );
  }
}
