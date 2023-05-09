import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

import '../screens/user/Modal/User.dart';
import '../screens/user/user_edit_screen.dart';

class InfoTab extends StatefulWidget {
  InfoTab({
    super.key,
    required this.user,
  });

  User user;

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  late User user = widget.user;

  List<InfoItem> infoContent() => [
        InfoItem(
          icon: FontAwesomeIcons.user,
          title: "Name",
          content: user.userName,
        ),
        InfoItem(
          title: "Gender",
          content: user.gender,
        ),
        InfoItem(
          title: "Phone",
          content: user.security.phoneNum,
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
              onTap: () async {
                // TODO Catch data
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserEditScreen(user: user),
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
          itemBuilder: (context, index) => InfoTile(info: infoContent()[index]),
        ),
      ],
    );
  }
}

class InfoItem {
  final IconData? icon;
  final String title;
  final String content;

  InfoItem({this.icon, required this.title, required this.content});
}

class InfoTile extends StatelessWidget {
  final InfoItem info;

  const InfoTile({
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
