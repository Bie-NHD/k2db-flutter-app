import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

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
                  labelColor: ColorsApp.defaultTextColor,
                  labelStyle: TextStyles.defaultStyle.semiBold.colorDefaultText,
                  indicator: BoxDecoration(
                      color: ColorsApp.tertiaryColors,
                      borderRadius: BorderRadius.circular(kBorderRadiusMin)),
                  tabs: [
                    Tab(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.circleInfo),
                            SizedBox(
                              width: k8Padding,
                            ),
                            Text("My Account"),
                          ]),
                    ),
                    Tab(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.shield),
                            SizedBox(
                              width: k8Padding,
                            ),
                            Text("Security"),
                          ]),
                    ),
                  ]),
              IndexedStack(
                index: selectedIndex,
                children: [InfoTab(user: widget._user), const SecurityTab()],
              ),
            ],
          )),
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
    return Padding(
      padding: const EdgeInsets.all(k12Padding),
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EditButton(),
            Flexible(
              flex: 2,
              child: ListView.builder(
                  itemCount: infoContent(user: _user).length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      infoContent(user: _user)[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class SecurityTab extends StatelessWidget {
  const SecurityTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(k12Padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EditButton(),
        ],
      ),
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
            ]),
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
