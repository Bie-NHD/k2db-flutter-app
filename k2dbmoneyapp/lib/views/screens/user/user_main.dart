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
import '../../widgets/widget_card_function.dart';
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
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.2,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadiusMax)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(k24Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserCard(user: user, isShowingBalance: isShowingBalance),
                const PointProgressBar(),
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
                        padding:
                            const EdgeInsets.symmetric(vertical: k8Padding),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    ]);
  }

  AppBar buildAppBar() {
    return AppBar(
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

class UserCard extends StatefulWidget {
  User user;
  bool isShowingBalance;
  int len;

  UserCard({
    super.key,
    required this.user,
    required this.isShowingBalance,
  }) : len = user.userBalance.toFormatMoney().toString().length;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: k8Padding,
        children: [
          CircleAvatar(
            radius: kIconSize * 1.5,
            child: HelperImage.loadFromAsset(widget.user.userAvatar,
                radius: BorderRadius.circular(kBorderRadiusIcon)),
          ),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: k8Padding,
            children: [
              Text(widget.user.userName.toUpperCase(),
                  style: TextStyles
                      .defaultStyle.semiBold.sizeHeading.colorDefaultText),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: widget.user.userID));
                },
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: k8Padding / 2,
                  children: [
                    Text(
                      widget.user.userID,
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
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: k12Margin),
        padding: const EdgeInsets.all(k16Padding),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.4],
                colors: [ColorsApp.primaryColor, ColorsApp.statusNoteColor]),
            borderRadius: BorderRadius.circular(kBorderRadiusMin)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k16Padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      widget.isShowingBalance
                          ? (widget.user.userBalance).toFormatMoney()
                          : (widget.user.userBalance)
                              .toFormatMoney()
                              .toString()
                              .replaceRange(0, widget.len, "*" * widget.len),
                      style: TextStyles
                          .defaultStyle.colorAppBarText.bold.sizeHeading),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isShowingBalance = !widget.isShowingBalance;
                      });
                    },
                    child: Icon(
                      widget.isShowingBalance
                          ? FontAwesomeIcons.solidEye
                          : FontAwesomeIcons.solidEyeSlash,
                      color: ColorsApp.statusNoteColor,
                      size: kIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.red),
        padding: EdgeInsets.all(k12Padding),
        child: IntrinsicHeight(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                CardItemFunction(
                  icon: FontAwesomeIcons.wallet,
                  text: "Balance",
                  color: ColorsApp.tertiaryColors,
                ),
                VerticalDivider(
                  color: ColorsApp.tertiaryColors,
                  indent: 3,
                  endIndent: 3,
                  thickness: 1.5,
                ),
                CardItemFunction(
                  icon: FontAwesomeIcons.qrcode,
                  text: "QR Scan",
                  color: ColorsApp.tertiaryColors,
                ),
                VerticalDivider(
                  color: ColorsApp.tertiaryColors,
                  indent: 3,
                  endIndent: 3,
                  thickness: 1.5,
                ),
                CardItemFunction(
                  icon: FontAwesomeIcons.wallet,
                  text: "Balance",
                  color: ColorsApp.tertiaryColors,
                ),
              ]),
        ),
      )
    ]);
  }
}
