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

  List<InfoContentItem> infoContent({required User user}) => [
        InfoContentItem(
            icon: FontAwesomeIcons.user, title: "Name", content: user.userName),
        InfoContentItem(
            title: "Gender", content: user.gender ?? "Not specified")
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: k8Margin),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserEditScreen(user: _user)));
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
          itemCount: infoContent(user: _user).length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => infoContent(user: _user)[index],
        ),
      ],
    );
  }
}

class InfoContentItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String content;
  const InfoContentItem(
      {super.key, this.icon, required this.title, required this.content});

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
          (icon != null)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                  child: Icon(
                    icon,
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
              title,
              style:
                  TextStyles.defaultStyle.semiBold.colorDefaultText.sizeDefault,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: k12Padding),
            child: Text(
              content,
              style:
                  TextStyles.defaultStyle.regular.colorDefaultText.sizeDefault,
            ),
          )
        ],
      ),
    );
  }
}
