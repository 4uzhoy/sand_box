import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sand_box/model/list_model.dart';
import 'package:sand_box/repository/analytics/event_type.dart';
import 'package:sand_box/repository/analytics/firebase_analytics_core.dart';
import 'package:sand_box/screens/app_screen.dart';
import 'package:sand_box/screens/list_screen.dart';
import 'package:sand_box/screens/page_a.dart';
import 'package:sand_box/service/local_notification/notification_service.dart';
import 'package:sand_box/service/workmanager/workmanager_service.dart';
import 'package:workmanager/workmanager.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.analytics,
  }) : super(key: key);

  final FirebaseAnalyticsCore analytics;

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListModel> _list;
  NotificationDetails platformChannelSpecifics;

  @override
  void initState() {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    widget.analytics.logAppState(AppStateEvent.appOpen, screenName: 'ListBloc');
    widget.analytics
        .logAppState(AppStateEvent.screenOpen, screenName: 'HomeScreen');
    _list = List<ListModel>.generate(
        15,
        (int index) =>
            ListModel(index, "title", index * 100.toDouble())); // [0, 1, 4]
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: <Widget>[],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("to list view"),
                textTheme: Theme.of(context).buttonTheme.textTheme,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ConcreteListScreen(_list)));
                  widget.analytics
                      .logEvent('list_bloc_pressed', {"list": _list.length});
                }),
            RaisedButton(
              child: Text("to CounterBloc"),
              textTheme: Theme.of(context).buttonTheme.textTheme,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => PageA())),
            ),
            RaisedButton(
              child: Text("show push notification"),
              textTheme: Theme.of(context).buttonTheme.textTheme,
              onPressed: () =>
                  {NotificationService.showNotification(0, "test", "test")},
            ),
            RaisedButton(
              child: Text("bottom navigation bloc"),
              textTheme: Theme.of(context).buttonTheme.textTheme,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => AppScreen())),
            ),
            RaisedButton(
              child: Text("set background task"),
              textTheme: Theme.of(context).buttonTheme.textTheme,
              onPressed: _setBackgroundTask,
            ),
            RaisedButton(
              child: Text("set background loop task"),
              textTheme: Theme.of(context).buttonTheme.textTheme,
              onPressed: _setBackgroundLoopTask,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _setBackgroundTask() {
    WorkManagerService.registerOneOffTask("111", "notificationTask",
        tag: "notify",
        initialDelay: Duration(seconds: 3),
        constraints: Constraints(networkType: NetworkType.connected),
        inputData: {'user': 1200});
  }

  void _setBackgroundLoopTask() {
    WorkManagerService.registerLoopTask(
      "111",
      "this is loop task",
    );
  }
}
/*yourGlobalBloc
  .whereType<AutoRoutingState>()
  .map<String>((state) => state.route)
  .forEach(pushNamed);*/
