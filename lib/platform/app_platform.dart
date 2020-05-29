import 'package:platform_info/platform_info.dart';

class AppPlatform{  
  static final  Platform _platform =Platform();

  String get version => _platform.version;
  Platform get platform => _platform;  
  
  }