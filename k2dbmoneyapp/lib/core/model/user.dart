import 'dart:math';

import 'package:k2dbmoneyapp/core/helpers/help_random.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';

class User {
  late String userID;
  late String? userName;
  late String gender;
  double userBalance;
  String userAvatar;
  final String? citizenID;
  late String? userPIN;
  int userPoint;
  List<int> pointGoals;
  late final String phoneNum;

  User({
    this.userName = "New User",
    this.userBalance = 0,
    this.userPoint = 0,
    this.pointGoals = const [0],
    this.gender = "Gender.blank",
    this.userAvatar = HelperAssets.placeholderUserAvatar,
    this.userPIN,
    this.citizenID,
    required this.phoneNum,
  }) {
    userID = HelperRNG.userID();
  }

  static User base = User(
      userName: "New User",
      phoneNum: "0909123456",
      gender: Gender.blank,
      userAvatar: HelperAssets.placeholderUserAvatar,
      userPoint: 200,
      pointGoals: [50, 100, 200, 400]);

  void setBalance(double amount) {
    userBalance = amount;
  }
}

class Gender {
  static const String blank = "Non-Specified";
  static const String enby = "Non-binary";
  static const String male = "Male";
  static const String female = "Female";
}
