import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/user_navigator.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import 'Modal/User.dart';
import 'Widgets/widget_user_tabbar.dart';

class UserScreen extends StatefulWidget {
  static const routeName = "/user_screen";

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  final String userID = "0123456789";

  final double userBalance = 123600;

  final bool isShowingBalance = false;

  late TabController _tabController;

  User user = User.base();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              size: kIconSize - 2,
            ),
            tooltip: "Notifications",
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(k24Padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserCard(userID: userID),
            const PointProgressBar(),
            UserNavigator(
                userBalance: userBalance, isShowingBalance: isShowingBalance),
            UserTabBar(
              tabController: _tabController,
              user: user,
            ),
            const Divider(
              color: ColorsApp.tertiaryColors,
              thickness: 2,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      size: kIconSize,
                      color: ColorsApp.statusErrorColor,
                    ),
                    const SizedBox(
                      width: k8Padding,
                    ),
                    Text(
                      "Log out",
                      style: TextStyles.defaultStyle.semiBold.colorRedText,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class PointProgressBar extends StatelessWidget {
  const PointProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: const EdgeInsets.only(top: k12Margin),
      padding: const EdgeInsets.all(k14Padding),
      decoration: BoxDecoration(
          color: ColorsApp.tertiaryColors,
          borderRadius: BorderRadius.circular(kBorderRadiusMax)),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.userID,
  }) : super(key: key);

  final String userID;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: kIconSize * 1.5,
          child: HelperImage.loadFromAsset(HelperAssets.imageAvt,
              radius: BorderRadius.circular(kBorderRadiusIcon)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Hoang Gia Kiet".toUpperCase(),
                style: TextStyles
                    .defaultStyle.semiBold.sizeHeading.colorDefaultText),
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: userID));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userID,
                    style: TextStyles.defaultStyle.colorHintText,
                  ),
                  const SizedBox(width: k8Padding),
                  const Icon(
                    FontAwesomeIcons.copy,
                    size: kIconSize * 0.8,
                    color: ColorsApp.defaultTextColor,
                  )
                ],
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(FontAwesomeIcons.angleRight,
              size: kIconSize * 1.5, color: ColorsApp.tertiaryColors),
        )
      ],
    );
  }
}
