import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

import '../../core/model/user.dart';
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
  final List<IconData?> _icons = [FontAwesomeIcons.user, null, null];
  final List<String?> _titles = ["Name", "Gender", "Phone"];
  late final List<String?> _contents = [
    user.userName,
    user.gender,
    user.security.phoneNum
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contents.length,
      padding: const EdgeInsets.only(top: k12Padding),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => UserListTile(
        content: _contents[index]!,
        icon: _icons[index],
        title: _titles[index],
      ),
    );
  }
}

class UserListTile extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String content;
  final Color? color;

  const UserListTile({
    super.key,
    this.icon,
    this.title,
    required this.content,
    this.color,
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
              title!,
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
