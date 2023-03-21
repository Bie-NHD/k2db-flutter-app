import 'dart:core';
import 'dart:math';

class IDGenerator {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString({int length = 9}) =>
      String.fromCharCodes(Iterable.generate(
          length, (index) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  String productID() => DateTime.now().millisecondsSinceEpoch.toString();
  String userID({int length = 9}) =>
      List<int>.generate(length, (index) => Random().nextInt(9) + 1)
          .join()
          .toString();
}