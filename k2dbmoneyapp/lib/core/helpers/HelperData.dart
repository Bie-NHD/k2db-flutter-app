import 'dart:math';

class HelperDataGeneration {
  static Random random = Random();

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static int nextInt(int max) {
    return random.nextInt(max);
  }

  static String getRandomString({int length = 9}) =>
      String.fromCharCodes(Iterable.generate(length,
          (index) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  static String productID() => DateTime.now().millisecondsSinceEpoch.toString();

  static String userID({int length = 9}) =>
      List<int>.generate(length, (index) => Random().nextInt(9) + 1)
          .join()
          .toString();
}
