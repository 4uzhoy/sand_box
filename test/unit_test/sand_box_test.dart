import 'package:flutter_test/flutter_test.dart';
import 'package:timeago/timeago.dart' as timeago;
// the file defined above, you can test any moor database of course

void main() {
  group('SandBox tests', () {
    setUp(() {});

    test('timeAgoDemo', () async {
      timeago.setLocaleMessages('ru', timeago.RuMessages());

      final fifteenHAgo = new DateTime.now().subtract(new Duration(hours: 15));
      final fifteenDAgo = new DateTime.now().subtract(new Duration(days: 15));

      var list1 = ['I', '💙', 'Flutter'];

      final list2 = list1;

      print(list2[2]);
      list2[2] = 'Dart'; // Will this line compile?
      // list2 =null;
      print(list2[2]);

      ///  const list3 = list1; // Will this line compile?

      print(timeago.format(fifteenHAgo)); // 15 minutes ago
      print(timeago.format(fifteenDAgo)); // 15 minutes ago

      print(timeago.format(fifteenHAgo, locale: 'ru')); // 15m
      print(timeago.format(fifteenDAgo, locale: 'ru')); // 15m
    });
  });
}
