import 'package:flutter/material.dart';

import 'app_config.dart';


class AppConfigDev implements AppConfig {
  final _appName = "(DEV)";

  @override
  String get appName => _appName;


  @override
  ColorSwatch get colorSwatch => Colors.orange;
}