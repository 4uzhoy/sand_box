import 'dart:async';

import 'package:l/l.dart';

class WorldTimeRepository {
  final StreamController<DateTime> _dtController = StreamController<DateTime>();
  StreamSubscription<DateTime> _dtSubsctiption;

  Stream<DateTime> get dtStream => _dtController.stream;
  StreamSubscription<DateTime> get dtSub => _dtSubsctiption;

  Stream<int> getTickerStream({int ticks}) =>
      Stream.periodic(Duration(seconds: 1));

  void startListen() {
    _dtSubsctiption = _dtController.stream.listen((event) {
      l.i(event.toIso8601String());
    });
  }

  void tickTime() {
    l.i('tick');
    _dtController.add(DateTime.now());
  }

  void close() {
    _dtSubsctiption.cancel();
    _dtController.close();
  }
}
