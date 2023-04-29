import 'dart:math';

import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';

class User {
  late final String userID = IDGenerator().userID();
  late String userName;
  String gender;
  double userBalance;
  Points userPoint;
  String userAvatar;
  late Security security;

  User({
    required this.userName,
    this.userBalance = 0,
    int userPoint = 0,
    List<int> pointGoals = const [0],
    this.gender = "Gender.blank",
    this.userAvatar = HelperAssets.placeholderUserAvatar,
    String PIN = "",
    String citizenID = "",
    required String phoneNum,
  })  : userPoint = Points(
            currentPoints: userPoint,
            currentGoal: pointGoals[0],
            pointGoals: pointGoals),
        security = Security(phoneNum: phoneNum, citizenID: citizenID, PIN: PIN);

  User.base({
    this.userBalance = 75130,
    this.gender = Gender.blank,
    this.userAvatar = HelperAssets.placeholderUserAvatar,
  })  : userPoint = Points.base,
        security = Security.base {
    userName = "User$userID";
  }
}

class Security {
  late String phoneNum;
  late bool hasValidatedCitizenID;
  late String? citizenID;
  late bool hasPIN;
  late String? PIN;

  Security({
    required this.phoneNum,
    this.citizenID = "",
    this.PIN = "",
  })  : hasValidatedCitizenID =
            (citizenID != null) && (citizenID != "") ? true : false,
        hasPIN = (PIN != null) && (PIN != "") ? true : false;

  static Security base =
      Security(phoneNum: "0909123456", citizenID: "079123456789", PIN: "5527");
}

class Points {
  late int currentPoints;
  int currentGoal;
  List<int> pointGoals;

  Points(
      {required this.currentPoints,
      this.currentGoal = 0,
      required this.pointGoals}) {
    if (currentGoal == 0) {
      updateCurrentPoints();
    }
  }

  static Points base =
      Points(currentPoints: 0, pointGoals: [5, 10, 15, 20], currentGoal: 5);

  void updateCurrentPoints() {
    int index = 0;
    while (index < pointGoals.length) {
      if (currentPoints >= pointGoals[index]) {
        ++index;
      }
    }
    currentGoal = pointGoals[index];
  }

  void increasePoints(int points) {
    currentPoints += points;
  }
}

class Gender {
  static const String blank = "Non-Specified";
  static const String enby = "Non-binary";
  static const String male = "Male";
  static const String female = "Female";
}

class IDGenerator {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString({int length = 9}) =>
      String.fromCharCodes(Iterable.generate(length,
          (index) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  String productID() => DateTime.now().millisecondsSinceEpoch.toString();
  String userID({int length = 9}) =>
      List<int>.generate(length, (index) => Random().nextInt(9) + 1)
          .join()
          .toString();
}

class UserController {
  static const phonePrefix = <int>[
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    52,
    56,
    58,
    59,
    70,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    96,
    97,
    98,
    99
  ];
  static bool validatePhoneNum(String num) {
    // eg. +84 912345678
    // +84 or 0 at index [0] -> 9 or 10 length
    // then, check valid comm provider prefix

    if (num.length < 9 || num.length > 10) {
      return false;
    }

    if (num.length == 10) {
      num = num.substring(1);
    }
    String prefix = num.substring(0, 2);
    Iterator iterator = phonePrefix.iterator;

    while (iterator.moveNext()) {
      if (iterator.current.toString() == prefix) {
        return true;
      }
    }

    return false;
  }
}
