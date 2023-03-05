import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:xid/xid.dart';
import '../../../../core/constant/text.dart';
import '../../../widgets/widget_horizontal_button.dart';
import '../Modal/User.dart';

List<InfoContentItem> infoContent({required User user}) {
  return [
    InfoContentItem(title: "Name", content: user.userName),
    InfoContentItem(title: "Gender", content: user.gender ?? "Not specified")
  ];
}

List<Widget> _securityContent() {
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
