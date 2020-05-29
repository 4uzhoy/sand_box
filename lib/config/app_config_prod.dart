import 'package:flutter/material.dart';

import 'app_config.dart';


class AppConfigProd implements AppConfig {
  final _appName = "Prodaction";

  @override
  String get appName => _appName;


  @override
  ColorSwatch get colorSwatch => Colors.deepPurple;
}