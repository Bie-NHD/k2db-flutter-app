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
  late User _user;
  @override
  void initState() {
    super.initState();
    _user = widget._user;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: k12Margin),
          child: Column(
            children: [
              NameTabs(widget: widget),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(
                  controller: widget._tabController,
                  children: [InfoTab(user: _user), const SecurityTab()],
                ),
              ),
            ],
          ),
        ));
  }
}

class NameTabs extends StatelessWidget {
  const NameTabs({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final UserTabBar widget;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: widget._tabController,
        labelPadding: const EdgeInsets.symmetric(horizontal: k12Padding),
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
        ]);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EditButton(),
          Flexible(
            child: ListView.builder(
                itemCount: infoContent(user: _user).length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    infoContent(user: _user)[index]),
          ),
        ],
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
      InfoContentItem(title: "Name", content: user.userName),
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
      padding: const EdgeInsets.symmetric(vertical: k12Padding),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
            side: const BorderSide(color: ColorsApp.tertiaryColors)),
        leading: Icon(
          icon,
          size: kIconSize,
          color: ColorsApp.defaultTextColor,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: k12Padding),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
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
        ),
      ),
    );
  }
}
