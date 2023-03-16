import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/widget_user_info_tab.dart';

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
  late List<Tab> tabs;

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

  @override
  void initState() {
    super.initState();
    tabs = [
      Tab(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
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
          ],
        ),
      ),
    ];
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

List<Widget> securityContent() => [];
