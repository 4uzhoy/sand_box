import 'package:sand_box/config/app_config.dart';
import 'package:sand_box/config/app_config_dev.dart';


import '../main.dart';
void main() {
  final AppConfig appConfig = AppConfigDev();
  mainCommon(appConfig);
}