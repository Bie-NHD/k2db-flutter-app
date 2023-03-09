import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:xid/xid.dart';

class User {
  late final String _userID = Xid().toString();
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

  String get userID => _userID;
}
