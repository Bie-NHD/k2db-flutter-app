import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_user_info_tab.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_user_security_tab.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

import '../../core/model/user.dart';

class UserTabBar extends StatefulWidget {
  const UserTabBar({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UserTabBar> createState() => _UserTabBarState();
}

class _UserTabBarState extends State<UserTabBar> with TickerProviderStateMixin {
  int selectedIndex = 0;
  late List<Tab> tabs;
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k12Padding),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    _tabController.animateTo(index);
                  });
                },
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: k12Padding),
                labelColor: Colors.white,
                unselectedLabelColor: ColorsApp.primaryColor,
                labelStyle: TextStyles.defaultStyle.semiBold.colorDefaultText,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusMin),
                  color: ColorsApp.primaryColor,
                ),
                tabs: tabs),
            IndexedStack(
              index: selectedIndex,
              children: [
                InfoTab(user: widget.user),
                SecurityTab(user: widget.user),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabs = [
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.circleInfo),
            SizedBox(
              width: k8Padding,
            ),
            Text("My Account"),
          ],
        ),
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
          ],
        ),
      ),
    ];
  }
}
