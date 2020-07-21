import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';
import 'package:sand_box/config/platform.dart';

import 'event_type.dart';

typedef logFunction = Future<void> Function({String logName});

class FirebaseAnalyticsCore {
  final BuildModeType buildModeType = Platform.buildMode;

  FirebaseAnalyticsCore();

  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();

  FirebaseAnalytics get fbAnalytics => _firebaseAnalytics;

  Future<void> logAppState(AppStateEvent appStateEvent,
      {@required String screenName, @required user}) async {
    switch (appStateEvent) {
      case AppStateEvent.appOpen:
        _logOnBuildMode(_firebaseAnalytics.logAppOpen(),
            l.s('DEBUG MODE\nоткрываем приложение'));
        break;

      case AppStateEvent.screenOpen:
        _logOnBuildMode(
            _firebaseAnalytics.setCurrentScreen(screenName: screenName),
            l.i('открываем экран $screenName'));
        break;
      case AppStateEvent.tutorialComplete:
        _logOnBuildMode(
            _firebaseAnalytics.logTutorialComplete(), l.i('Обучение пройдено'));
        break;
      case AppStateEvent.login:
        _logOnBuildMode(_firebaseAnalytics.logLogin(loginMethod: user),
            l.i('аворизован под $user'));
        break;
    }
  }

  void logEvent(String eventName, Map<String, dynamic> params) {
    //_l.i('$eventName');
    _logOnBuildMode(
        _firebaseAnalytics.logEvent(name: eventName, parameters: params),
        l.i('событие $eventName, params:${params.toString() ?? 'null'}'));
  }

  void _logOnBuildMode(Future<void> analyticFunction, void logFunction) async {
    switch (this.buildModeType) {
      case BuildModeType.release:
        await analyticFunction;
        break;
      case BuildModeType.debug:
        // ignore: unnecessary_statements
        logFunction;
        break;
      case BuildModeType.profile:
        return;
        break;
    }
  }
}
