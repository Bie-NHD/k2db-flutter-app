import 'dart:core';
import 'dart:math';

class IDGenerator {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rand = Random();

  String getRandomString({int length = 9}) =>
      String.fromCharCodes(Iterable.generate(
          length, (index) => _chars.codeUnitAt(_rand.nextInt(_chars.length))));

  String productID() => DateTime.now().millisecondsSinceEpoch.toString();
  String userID({int length = 9}) =>
      List.generate(length, (index) => _rand.nextInt(9) + 1).toString();
}
