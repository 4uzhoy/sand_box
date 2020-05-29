
import 'package:sand_box/config/app_config.dart';
import 'package:sand_box/config/app_config_prod.dart';

import '../main.dart';

void main() {
  final AppConfig appConfig = AppConfigProd();


  mainCommon(appConfig);
}