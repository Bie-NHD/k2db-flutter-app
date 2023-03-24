import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/id_generator.dart';

class User {
  final String userID = IDGenerator().userID();
  late String userName;
  String? gender;
  double userBalance;
  Points userPoint;
  String userAvatar;
  Security security;

  User(
      {required this.userName,
      this.userBalance = 0,
      int userPoint = 0,
      List<int> pointGoals = const [0],
      this.gender = Gender.blank,
      this.userAvatar = HelperAssets.placeholderUserAvatar,
      this.userPhone})
      : userPoint = Points(
            currentPoints: userPoint,
            currentGoal: pointGoals[0],
            pointGoals: pointGoals);

  User.base({
    this.userName = "John",
    this.userBalance = 75130,
    this.gender = Gender.blank,
    this.userAvatar = HelperAssets.placeholderUserAvatar,
    this.security = Security.base(),
  }) : userPoint = Points.base();
}

class Gender {
  static const String blank = "Non-Specified";
  static const String enby = "Non-binary";
  static const String male = "Male";
  static const String female = "Female";
}

class Security {
  late String phoneNum;
  bool hasValidatedCitizenID;
  String? citizenID;
  bool hasPIN;
  String? PIN;

  Security({
    required this.phoneNum,
    this.citizenID,
    this.PIN,
  })  : hasValidatedCitizenID = citizenID != null ? true : false,
        hasPIN = PIN != null ? true : false;

  static Security base() {
    return Security(phoneNum: "0909123456");
  }
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
      updateCurretPoints();
    }
  }

  static Points base() => Points(currentPoints: 0, pointGoals: [5, 10, 15, 20]);

  updateCurretPoints() {
    int index = 0;
    while (index < pointGoals.length) {
      if (currentPoints >= pointGoals[index]) {
        ++index;
      }
    }
    currentGoal = pointGoals[index];
  }

  addPoints(int points) {
    currentPoints += points;
  }
}
