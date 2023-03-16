import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_edit_screen.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import '../Modal/User.dart';

class UserTabBar extends StatefulWidget {
  const UserTabBar(
      {Key? key, required TabController tabController, required User user})
      : _tabController = tabController,
        _user = user,
        super(key: key);

  final TabController _tabController;
  final User _user;

  @override
  State<UserTabBar> createState() => _UserTabBarState();
}

class _UserTabBarState extends State<UserTabBar> {
  int selectedIndex = 0;
  List<Tab> tabs = [
    Tab(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Icon(FontAwesomeIcons.circleInfo),
        SizedBox(
          width: k8Padding,
        ),
        Text("My Account"),
      ]),
    ),
    Tab(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Icon(FontAwesomeIcons.shield),
        SizedBox(
          width: k8Padding,
        ),
        Text("Security"),
      ]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k12Padding),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
                controller: widget._tabController,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    widget._tabController.animateTo(index);
                  });
                },
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: k12Padding),
                labelColor: Colors.white,
                unselectedLabelColor: ColorsApp.primaryColor,
                labelStyle: TextStyles.defaultStyle.semiBold.colorDefaultText,
                indicator: BoxDecoration(
                  // color: ColorsApp.primaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadiusMin),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.7],
                    colors: [ColorsApp.primaryColor, ColorsApp.statusNoteColor],
                  ),
                ),
                tabs: tabs),
            IndexedStack(
              index: selectedIndex,
              children: [
                InfoTab(user: widget._user),
                const SecurityTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

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

class SecurityTab extends StatelessWidget {
  const SecurityTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          const InfoContentItem(title: "a", content: "b"),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: k8Margin),
      child: Align(
        alignment: Alignment.centerRight,
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
    );
  }
}

List<InfoContentItem> infoContent({required User user}) => [
      InfoContentItem(
          icon: FontAwesomeIcons.user, title: "Name", content: user.userName),
      InfoContentItem(title: "Gender", content: user.gender ?? "Not specified")
    ];
List<Widget> securityContent() => [];

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
