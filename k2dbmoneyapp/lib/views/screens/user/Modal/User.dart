import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/ID_generator.dart';


class User {
  late final String userID = IDGenerator().userID();
  late String userName;
  String? gender;
  int userBalance;
  int userPoint;
  String? userAvatar;

  User(
      {required this.userName,
      this.userBalance = 0,
      this.userPoint = 0,
      this.gender,
      this.userAvatar = HelperAssets.placeholderUserAvatar});

  User.base(
      {this.userName = "John",
      this.userBalance = 0,
      this.userPoint = 0,
      this.userAvatar = HelperAssets.placeholderUserAvatar});
}
