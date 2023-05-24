import 'dart:math';

import 'package:k2dbmoneyapp/core/helpers/help_random.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';

class User {
  final String userID;
  late final String? userName;
  late final String gender;
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
  })  : userID = HelperRNG.userID(),
        userPoint = Points(
            currentPoints: userPoint,
            currentGoal: pointGoals[0],
            pointGoals: pointGoals),
        security = Security(phoneNum: phoneNum, citizenID: citizenID, PIN: PIN);

  static User base = User(
      userName: "New User",
      phoneNum: Security.base.phoneNum,
      userBalance: 75130,
      gender: Gender.blank,
      userAvatar: HelperAssets.placeholderUserAvatar,
      pointGoals: Points.base.pointGoals);

  void setBalance(double amount) {
    userBalance = amount;
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
