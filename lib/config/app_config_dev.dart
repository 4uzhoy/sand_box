import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:sand_box/repository/analytics/firebase_analytics_core.dart';
import 'package:sand_box/resource/themes/dev_theme.dart';

import 'app_config.dart';

class AppConfigDev implements AppConfig {
  final _appName = "(DEV)";
  final FirebaseAnalyticsCore _firebaseAnalyticsCore = FirebaseAnalyticsCore();

  @override
  String get appName => _appName;

  @override
  ColorSwatch get colorSwatch => Colors.orange;

  @override
  ThemeData get themeData => devTheme;

  @override
  FirebaseAnalyticsCore get firebaseAnalyticsCore => _firebaseAnalyticsCore;

  @override
  bool get useAnalytics => false;

  @override
  FirebaseAnalytics get firebaseAnalytics => _firebaseAnalyticsCore.fbAnalytics;
}
