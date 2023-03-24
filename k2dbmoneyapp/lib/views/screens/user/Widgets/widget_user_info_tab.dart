import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import '../Modal/User.dart';
import '../user_edit_screen.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  List<Info> infoContent() => [
        Info(
          icon: FontAwesomeIcons.user,
          title: "Name",
          content: _user.userName,
        ),
        Info(
          title: "Gender",
          content: _user.gender ?? "Not specified",
        ),
        Info(
          title: "Phone",
          content: _user.userPhone ?? "",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Edit Button
        Container(
          margin: const EdgeInsets.symmetric(vertical: k8Margin),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserEditScreen(user: _user),
                    ));
              },
              child: Wrap(
                direction: Axis.horizontal,
                spacing: k8Padding,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Edit",
                    style: TextStyles.defaultStyle.semiBold.colorDefaultText,
                  ),
                  const Icon(
                    FontAwesomeIcons.pen,
                    size: kIconSize,
                  ),
                  const Icon(
                    FontAwesomeIcons.angleRight,
                    size: kIconSize,
                  )
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
          itemCount: infoContent().length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => InfoItem(info: infoContent()[index]),
        ),
      ],
    );
  }
}

class Info {
  final IconData? icon;
  final String title;
  final String content;

  Info({this.icon, required this.title, required this.content});
}

class InfoItem extends StatelessWidget {
  // final IconData? icon;
  // final String title;
  // final String content;
  final Info info;

  const InfoItem({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: k8Margin),
      padding: const EdgeInsets.all(k12Padding),
      decoration: BoxDecoration(
          color: ColorsApp.backgroundLight,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
          border: Border.all(color: ColorsApp.tertiaryColors)),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 2 * k24Padding),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          (info.icon != null)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                  child: Icon(
                    info.icon,
                    size: kIconSize,
                    color: ColorsApp.defaultTextColor,
                  ),
                )
              : const SizedBox(
                  width: k12Padding * 2 + kIconSize,
                ),
          Padding(
            padding: const EdgeInsets.only(left: k12Padding),
            child: Text(
              info.title,
              style:
                  TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: k12Padding),
            child: Text(
              info.content,
              style:
                  TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,
            ),
          )
        ],
      ),
    );
  }
}
