import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/helpers/helper_image.dart';
import '../../../widgets/widget_card_function.dart';
import '../Modal/User.dart';
import 'widget_user_tabbar.dart';

class UserMainBody extends StatefulWidget {
  UserMainBody({
    Key? key,
    required this.user,
    required this.isShowingBalance,
    required TabController tabController,
  })  : _tabController = tabController,
        balanceDisplay = user.userBalance.toFormatMoney(),
        super(key: key);

  final User user;
  bool isShowingBalance;
  final TabController _tabController;
  late String balanceDisplay;

  @override
  State<UserMainBody> createState() => _UserMainBodyState();
}

class _UserMainBodyState extends State<UserMainBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          IntrinsicHeight(
            child: //Gradient
                Container(
              width: double.infinity,
              height: size.height * 0.32,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0,
                      0.5
                    ],
                    colors: [
                      ColorsApp.primaryColor,
                      ColorsApp.statusNoteColor
                    ]),
              ),
              child: Stack(
                children: [
                  // Balance Display
                  Positioned(
                    top: size.height * 0.1,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      padding:
                          const EdgeInsets.symmetric(horizontal: k24Padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Balance".toUpperCase(),
                            style: TextStyles.defaultStyle.semiBold.sizeDefault
                                .colorAppBarText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.isShowingBalance
                                    ? widget.balanceDisplay
                                    : widget.balanceDisplay.replaceRange(
                                        0,
                                        widget.balanceDisplay.length,
                                        "*" * widget.balanceDisplay.length),
                                style: TextStyles
                                    .defaultStyle.bold.colorAppBarText
                                    .copyWith(fontSize: 30),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.isShowingBalance =
                                        !widget.isShowingBalance;
                                  });
                                },
                                child: Icon(
                                  widget.isShowingBalance
                                      ? FontAwesomeIcons.solidEye
                                      : FontAwesomeIcons.solidEyeSlash,
                                  color: ColorsApp.appBarTextColor,
                                  size: kIconSize,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Header Decoration
                  Positioned(
                    top: size.height * 0.24,
                    left: 0,
                    right: 0,
                    child: Container(
                      // height: size.height * 0.1,
                      // margin: EdgeInsets.only(top: size.height * 0.2),
                      padding: EdgeInsets.only(top: size.height * 0.25),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kBorderRadiusMax),
                              topRight: Radius.circular(kBorderRadiusMax))),
                    ),
                  ),

                  // User Header
                  Positioned(
                    top: size.height * 0.2,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(k12Padding),
                          decoration: BoxDecoration(
                              color: ColorsApp.backgroundLight,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadiusMin),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        ColorsApp.primaryColor.withOpacity(0.5),
                                    offset: const Offset(3, 3),
                                    blurRadius: 10,
                                    spreadRadius: 2)
                              ]),
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: k8Padding,
                            children: [
                              CircleAvatar(
                                radius: kIconSize * 1.5,
                                child: HelperImage.loadFromAsset(
                                    widget.user.userAvatar,
                                    radius: BorderRadius.circular(
                                        kBorderRadiusIcon)),
                              ),
                              Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.spaceAround,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: k8Padding,
                                children: [
                                  Text(widget.user.userName.toUpperCase(),
                                      style: TextStyles.defaultStyle.semiBold
                                          .sizeHeading.colorDefaultText),
                                  GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: widget.user.userID));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          duration: Duration(seconds: 2),
                                          content: Text(
                                              "User ID Copied to Clipboard!"),
                                        ),
                                      );
                                    },
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.spaceBetween,
                                      spacing: k8Padding / 2,
                                      children: [
                                        Text(
                                          widget.user.userID,
                                          style: TextStyles
                                              .defaultStyle.colorHintText,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Buttons
          Container(
            // margin: const EdgeInsets.only(top: k12Margin),
            padding: const EdgeInsets.all(k12Padding),
            decoration: const BoxDecoration(color: ColorsApp.backgroundLight),
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
                ],
              ),
            ),
          ),
          // Main content
          Container(
            color: Colors.white,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: k24Padding),
                  child: UserTabBar(
                    tabController: widget._tabController,
                    user: widget.user,
                  ),
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
