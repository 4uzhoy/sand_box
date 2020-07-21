class Platform {
  static BuildModeType get buildMode => _getCurrentBuildMode();
  static bool _releaseMode;
  static bool _debugMode;
  static bool get isRelease =>
      _releaseMode ?? const bool.fromEnvironment('dart.vm.product');
  static bool get isDebug =>
      _debugMode ?? !const bool.fromEnvironment('dart.vm.product');

  static BuildModeType _getCurrentBuildMode() => (() {
        if (const bool.fromEnvironment('dart.vm.product')) {
          _releaseMode = true;
          return BuildModeType.release;
        }
        BuildModeType result = BuildModeType.profile;
        assert(() {
          /// assert отрабатывает только в дебаге, поэтому можно увтерждать debug
          _debugMode = true;
          result = BuildModeType.debug;

          return true;
        }());
        return result;
      }());
}

enum BuildModeType { release, debug, profile }
