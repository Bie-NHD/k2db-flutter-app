import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/id_generator.dart';

class User {
  final String userID = IDGenerator().userID();
  late String userName;
  String? gender;
  double userBalance;
  Points userPoint;
  String userAvatar;

  User(
      {required this.userName,
      this.userBalance = 0,
      int userPoint = 0,
      List<int> pointGoals = const [0],
      this.gender = "Non-Specified",
      this.userAvatar = HelperAssets.placeholderUserAvatar})
      : userPoint = Points(
            currentPoints: userPoint,
            currentGoal: pointGoals[0],
            pointGoals: pointGoals);

  User.base(
      {this.userName = "John",
      this.userBalance = 75130,
      this.gender = "Non-Specified",
      this.userAvatar = HelperAssets.placeholderUserAvatar})
      : userPoint = Points.base();
}

class SecurityInfo {
  late String phoneNum;
  bool hasValidatedCitizenID = false;
  late String citizenID;
  bool hasPIN = false;
  late String PIN;
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

  Points.base({this.currentPoints = 0, this.pointGoals = const [5, 10, 15, 20]})
      : currentGoal = pointGoals[0];

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
