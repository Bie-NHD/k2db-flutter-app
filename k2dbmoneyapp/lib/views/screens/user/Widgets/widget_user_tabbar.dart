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
  late User user;
  @override
  void initState() {
    super.initState();
    user = widget._user;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(
              height: k12Margin,
            ),
            TabBar(
                controller: widget._tabController,
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: TabBarView(
                controller: widget._tabController,
                children: [InfoTab(user: user), SecurityTab()],
              ),
            ),
          ],
        ));
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(k12Padding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7),
          child: ListView.builder(
              itemCount: user.infoContent().length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile()),
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
          EditButton(),
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
    return Align(
        alignment: Alignment.centerRight,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
            ]
                .map(
                  (e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: k8Padding / 2),
                    child: e,
                  ),
                )
                .toList()));
  }
}
