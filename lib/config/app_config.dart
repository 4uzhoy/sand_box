import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:sand_box/repository/analytics/firebase_analytics_core.dart';

abstract class AppConfig {
  String get appName;
  ColorSwatch get colorSwatch;
  ThemeData get themeData;
  bool get useAnalytics;
  FirebaseAnalyticsCore get firebaseAnalyticsCore;
  FirebaseAnalytics get firebaseAnalytics;
}
