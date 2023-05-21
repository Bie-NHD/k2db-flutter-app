import 'dart:math';

class HelperRNG {
  static final Random _random = Random();

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static final List<String> _names = [
    "Nguyen Huong",
    "Hoang Gia Kiet",
    "Nguyen Thanh Luan",
    "Pham Quoc Khanh",
    "Vo Che Bang",
    "Tran Quoc Khanh"
  ];

  static int nextInt(int max) => _random.nextInt(max);

  static String getRandomString({int length = 9}) =>
      String.fromCharCodes(Iterable.generate(length,
          (index) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  static String productID() => DateTime.now().millisecondsSinceEpoch.toString();

  static String userID({int length = 9}) =>
      List<int>.generate(length, (index) => Random().nextInt(9) + 1)
          .join()
          .toString();

  static String randName() => _names[nextInt(_names.length)];
  static String randDateTime() =>
      DateTime.fromMillisecondsSinceEpoch(1577836800000 + nextInt(300000))
          .toString();
  // 1577836800000 = 01/01/2020
}
