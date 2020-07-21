import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_core.dart';

class NotificationService {
  static void showNotification(
      {AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('your channel id',
              'your channel name', 'your channel description',
              importance: Importance.Max,
              priority: Priority.High,
              ticker: 'ticker'),
      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails()}) {
    flutterLocalNotificationsPlugin.show(
        1, "test", "body", _platformChannelSpecifics,
        payload: "test payload item x");
  }

  static AndroidNotificationDetails _androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.Max,
          priority: Priority.High,
          ticker: 'ticker');
  static IOSNotificationDetails _iOSPlatformChannelSpecifics =
      IOSNotificationDetails();
  static NotificationDetails _platformChannelSpecifics = NotificationDetails(
      _androidPlatformChannelSpecifics, _iOSPlatformChannelSpecifics);
}

/*
  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  //requestIOSPermissions(flutterLocalNotificationsPlugin);

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  flutterLocalNotificationsPlugin.show(
      1, "test", "body", platformChannelSpecifics,
      payload: "test payload item x");*/
