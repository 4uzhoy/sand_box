import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:l/l.dart';
import 'package:rxdart/rxdart.dart';

import 'model/reminder_notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;

class NotificationCore {
  static final BehaviorSubject<ReminderNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReminderNotification>();

  static final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  static Future<void> init() async {
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    await _initNotifications(flutterLocalNotificationsPlugin);
    //requestIOSPermissions(flutterLocalNotificationsPlugin);
  }

  static Future<void> _initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification:
                (int id, String title, String body, String payload) async {
              didReceiveLocalNotificationSubject.add(ReminderNotification(
                  id: id, title: title, body: body, payload: payload));
            });
    InitializationSettings initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        l.i('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });
  }
}

/**/
