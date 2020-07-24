import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:async/async.dart' show StreamGroup;
import 'package:grinder/grinder.dart';

String get flutter => io.Platform.isWindows ? r'flutter.bat' : r'flutter';
main(args) => grind(args);

@Task()
test() => new TestRunner().testAsync();

@Task()
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();

@Task('Codegenerate')
Future<void> generateCode() async => _logProcessOutput(
      flutter,
      <String>[
        'pub',
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs'
      ],
    );

@Task()
Future<void> watch() async => _logProcessOutput(
      flutter,
      <String>['pub', 'run', 'build_runner', 'watch'],
    );

@Task('Switch to beta channel')
Future<void> beta() async => _logProcessOutput(
      flutter,
      <String>['channel', 'beta'],
    ).whenComplete(upgrade);

@Task('Switch to beta channel')
Future<void> stable() async => _logProcessOutput(
      flutter,
      <String>['channel', 'stable'],
    ).whenComplete(upgrade);

@Task('debug web')
Future<void> debugWeb() => _logProcessOutput(
      flutter,
      <String>[
        'run',
        '-d',
        'chrome',
        '--debug',
        '--web-hostname',
        'localhost',
        '--web-port',
        '5000'
      ],
    );

@Task('enable web support')
Future<void> enableWeb() => _logProcessOutput(
      flutter,
      <String>['config', '--enable-web'],
    );

@Task('Upgrade flutter')
Future<void> upgrade() async => _logProcessOutput(
      flutter,
      <String>['upgrade'],
    );

@Task('flutter --version')
Future<void> version() async => _logProcessOutput(
      flutter,
      <String>['--version'],
    );

@DefaultTask()
@Task('flutter doctor')
Future<void> doctor() async => _logProcessOutput(
      flutter,
      <String>['doctor'],
    );

Future<void> _logProcessOutput(
    String executable, List<String> arguments) async {
  final io.Process process = await io.Process.start(
    executable,
    arguments,
  );
  final Stream<List<int>> output = StreamGroup.merge<List<int>>(
      <Stream<List<int>>>[process.stdout, process.stderr]);
  await for (final List<int> message in output) {
    log(utf8.decode(message));
  }
}
