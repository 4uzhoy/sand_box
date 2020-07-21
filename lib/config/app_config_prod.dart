import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:sand_box/repository/analytics/firebase_analytics_core.dart';
import 'package:sand_box/resource/themes/prod_theme.dart';

import 'app_config.dart';

class AppConfigProd implements AppConfig {
  final _appName = "Production";
  final _themeData = prodTheme;
  final FirebaseAnalyticsCore _firebaseAnalyticsCore = FirebaseAnalyticsCore();

  @override
  String get appName => _appName;

  @override
  ThemeData get themeData => _themeData;

  @override
  ColorSwatch get colorSwatch => Colors.deepPurple;

  @override
  bool get useAnalytics => true;

  @override
  FirebaseAnalyticsCore get firebaseAnalyticsCore => _firebaseAnalyticsCore;

  @override
  FirebaseAnalytics get firebaseAnalytics => _firebaseAnalyticsCore.fbAnalytics;
}
