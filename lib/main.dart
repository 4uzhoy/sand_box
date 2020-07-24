import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:l/l.dart';
import 'package:sand_box/bloc/navigation/navigator_bloc.dart';
import 'package:sand_box/service/local_notification/notification_service.dart';
import 'package:sand_box/service/workmanager/workmanager_service.dart';
import 'package:workmanager/workmanager.dart';

import 'bloc/app_bloc_observer.dart';
import 'config/app_config.dart';
import 'my_app.dart';
import 'service/local_notification/notification_core.dart';

bool isWMinited = false;

/// В этой штуке выполняем всю работу
callbackDispatcher() {
  Workmanager.executeTask((task, inputData) {
    l.s("task $task");
    l.s("task ${inputData.toString()}"); //simpleTask will be emitted here.
    NotificationService.showNotification(
        0, "backgroundNotification", "backgroundNotification BODY { }");
    return Future.value(true);
  });
}

Future<void> mainCommon(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  _initWM();
  _initBloc();
  _initPushNotification();

  WorkManagerService.cancelAllWMTasks();
  //WorkManagerService.registerOneOffTask("sv12002", "visitresult",inputData: {'visit': 13});

  // NotificationService.showNotification();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigatorBloc>(
      create: (BuildContext context) => NavigatorBloc(),
    ),
  ], child: MyApp(appConfig, flutterLocalNotificationsPlugin)));
}

_initWM() {
  Workmanager.initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  isWMinited = true;
}

_initBloc() async {
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build();
}

_initPushNotification() async {
  await NotificationCore.init();
}
