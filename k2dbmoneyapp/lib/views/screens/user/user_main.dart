import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import '../../widgets/widget_card_function_filled.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.primaryColor,
        shadowColor: Colors.transparent,
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
            UserCard(user: user),
            const PointProgressBar(),
            UserNavigator(user: user, isShowingBalance: isShowingBalance),
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
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: k8Padding,
                  children: [
                    const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      size: kIconSize,
                      color: ColorsApp.statusErrorColor,
                    ),
                    Text(
                      "Log out",
                      style: TextStyles.defaultStyle.semiBold.colorRedText,
                    )
                  ],
                ))
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: k8Padding),
                    child: e,
                  ))
              .toList(),
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
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: k8Padding,
        children: [
          CircleAvatar(
            radius: kIconSize * 1.5,
            child: HelperImage.loadFromAsset(user.userAvatar,
                radius: BorderRadius.circular(kBorderRadiusIcon)),
          ),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: k8Padding,
            children: [
              Text(user.userName.toUpperCase(),
                  style: TextStyles
                      .defaultStyle.semiBold.sizeHeading.colorDefaultText),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: user.userID));
                },
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: k8Padding / 2,
                  children: [
                    Text(
                      user.userID,
                      style: TextStyles.defaultStyle.colorHintText,
                    ),
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
        ],
      ),
    );
  }
}

class UserNavigator extends StatefulWidget {
  User user;
  bool isShowingBalance;
  int len;

  UserNavigator({
    super.key,
    required this.user,
    required this.isShowingBalance,
  }) : len = user.userBalance.toFormatMoney().toString().length;

  @override
  State<UserNavigator> createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      margin: const EdgeInsets.only(top: k12Margin),
      padding: const EdgeInsets.all(k14Padding),
      decoration: BoxDecoration(
          color: ColorsApp.secondaryColor,
          borderRadius: BorderRadius.circular(kBorderRadiusMax)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: k8Padding,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isShowingBalance = !widget.isShowingBalance;
                  });
                },
                child: Icon(widget.isShowingBalance
                    ? FontAwesomeIcons.solidEye
                    : FontAwesomeIcons.solidEyeSlash),
              ),
              Text(
                widget.isShowingBalance
                    ? (widget.user.userBalance).toFormatMoney()
                    : (widget.user.userBalance)
                        .toFormatMoney()
                        .toString()
                        .replaceRange(0, widget.len, "*" * widget.len),
                style: TextStyle(
                    fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                    fontSize: TextStyles.defaultStyle.sizeHeading.fontSize),
              )
            ],
          ),
          Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: k8Padding,
              children: const [
                FilledCardItemFunction(
                  icon: FontAwesomeIcons.wallet,
                  text: "Balance",
                  backgroundColor: ColorsApp.backgroundDark,
                  color: ColorsApp.secondaryColor,
                  size: kIconSize * 1.8,
                ),
                FilledCardItemFunction(
                  icon: FontAwesomeIcons.qrcode,
                  text: "QR Scan",
                  backgroundColor: ColorsApp.backgroundDark,
                  color: ColorsApp.secondaryColor,
                  size: kIconSize * 1.8,
                ),
                FilledCardItemFunction(
                  icon: FontAwesomeIcons.wallet,
                  text: "Balance",
                  backgroundColor: ColorsApp.backgroundDark,
                  color: ColorsApp.secondaryColor,
                  size: kIconSize * 1.8,
                ),
              ])
        ],
      ),
    );
  }
}
