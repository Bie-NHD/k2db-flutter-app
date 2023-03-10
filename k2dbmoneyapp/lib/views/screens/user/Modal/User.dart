import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/ID_generator.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

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

  List<InfoContentItem> infoContent() => [
        InfoContentItem(title: "Name", content: userName),
        InfoContentItem(title: "Gender", content: gender ?? "Not specified")
      ];
}

List<Widget> securityContent() {
  return [];
}

class InfoContentItem extends StatelessWidget {
  IconData? icon;
  final String title;
  final String content;
  InfoContentItem(
      {super.key, this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: ColorsApp.backgroundLight,
          boxShadow: [
            BoxShadow(
                color: ColorsApp.tertiaryColors,
                offset: Offset(5, 5),
                blurRadius: 5)
          ]),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Icon(
            icon,
            size: kIconSize,
            color: ColorsApp.defaultTextColor,
          ),
          Text(
            title,
            style: TextStyles.defaultStyle.semiBold.colorDefaultText,
          ),
          Text(
            content,
            style: TextStyles.defaultStyle.regular.colorDefaultText,
          )
        ],
      ),
    );
  }
}
