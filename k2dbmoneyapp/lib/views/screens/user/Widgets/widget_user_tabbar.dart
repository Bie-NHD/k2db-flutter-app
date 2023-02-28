import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

class UserTabBar extends StatefulWidget {
  const UserTabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  State<UserTabBar> createState() => _UserTabBarState();
}

class _UserTabBarState extends State<UserTabBar> {
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
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: widget._tabController,
                children: [
                  Text(
                    "Test1",
                    style: TextStyles.defaultStyle.sizeHeading,
                  ),
                  Text(
                    "Test2",
                    style: TextStyles.defaultStyle.sizeHeading,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
