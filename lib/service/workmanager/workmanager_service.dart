import 'package:l/l.dart';
import 'package:sand_box/main.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  static void registerOneOffTask(
    String uniqueName,
    String taskName, {
    String tag,
    ExistingWorkPolicy existingWorkPolicy,
    Duration initialDelay,
    Constraints constraints,
    BackoffPolicy backoffPolicy,
    Duration backoffPolicyDelay,
    Map<String, dynamic> inputData,
  }) {
    _checkWMCoreInitialisated(
        Workmanager.registerOneOffTask(
          uniqueName,
          taskName,
          tag: tag,
          existingWorkPolicy: existingWorkPolicy,
          initialDelay: initialDelay ?? const Duration(seconds: 0),
          constraints: constraints,
          backoffPolicy: backoffPolicy,
          backoffPolicyDelay: backoffPolicyDelay ?? const Duration(seconds: 0),
          inputData: inputData,
        ),
        logMessage: 'registerOneOffTask $uniqueName');
  }

  static void registerLoopTask(String uniqueName, String taskName) {
    _checkWMCoreInitialisated(
        Workmanager.registerPeriodicTask(uniqueName, taskName),
        logMessage: 'registerLoopTask $uniqueName');
  }

  static void cancelAllWMTasks() {
    _checkWMCoreInitialisated(Workmanager.cancelAll(), logMessage: 'cancelAll');
  }

  static void cancelWMTaskByTag(String tag) {
    _checkWMCoreInitialisated(Workmanager.cancelByTag(tag),
        logMessage: 'cancelWMTaskByTag $tag');
  }

  static void cancelWMTaskByUniqueName(String uniqueName) {
    _checkWMCoreInitialisated(Workmanager.cancelByUniqueName(uniqueName),
        logMessage: 'cancelWMTaskByUniqueName $uniqueName');
  }

  /* static void as(){
    _checkWMCoreInitialisated(Workmanager.)
  }*/

  /// ПРоверка воркменеджера на инициализацию
  /// передаем функцию на исполнение, если инициализация произошла или Exception
  static void _checkWMCoreInitialisated(Future<void> registerTask,
      {String logMessage = 'task'}) {
    l.i('check wm init');
    if (!isWMinited)
      throw UnimplementedError();
    else {
      l.i('run wm $logMessage');
      registerTask;
    }
  }
}
