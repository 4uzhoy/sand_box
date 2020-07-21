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
