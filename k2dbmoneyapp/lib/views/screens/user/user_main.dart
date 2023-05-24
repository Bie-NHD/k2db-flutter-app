import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/DecorationStyles.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/help_random.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_edit_screen.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import '../../../core/helpers/helper_asset.dart';
import '../../../core/helpers/helper_image.dart';
import '../../widgets/widget_card_function.dart';
import '../../widgets/widget_user_tabbar.dart';
import '../../../core/model/user.dart';
import 'qr_screen.dart';

class UserScreen extends StatefulWidget {
  UserScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "/user_screen";
  final user = User.base
    ..userBalance = Random().nextInt(100) * 1000
    ..userPoint = (HelperRNG.randDouble(5) * 100).round();
  bool isShowingBalance = false;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late String balanceDisplay = widget.user.userBalance.toFormatMoney();
  late String balanceUnDisplay = balanceDisplay.replaceRange(
      0, balanceDisplay.length, "*" * balanceDisplay.length);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.32,
              decoration: const BoxDecoration(color: ColorsApp.primaryColor),
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
                                    ? balanceDisplay
                                    : balanceUnDisplay,
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
                      padding: EdgeInsets.only(top: size.height * 0.25),
                      decoration: const BoxDecoration(
                          color: ColorsApp.backgroundLight,
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
                    child: _UserHeader(user: widget.user),
                  ),
                ],
              ),
            ),
            // Buttons
            _HeaderButtons(user: widget.user),
            _UserPointBanner(size: size, points: widget.user.userPoint),
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
                      user: widget.user,
                    ),
                  ),
                  // const Divider(
                  //   color: ColorsApp.tertiaryColors,
                  //   thickness: 2,
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Switch Account",
                              style: TextStyles.defaultStyle.colorDeepBlueText,
                            ),
                            icon: const Icon(
                              FontAwesomeIcons.rotate,
                              size: kIconSize,
                              color: ColorsApp.primaryColor,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Log out",
                              style: TextStyles.defaultStyle.colorDeepBlueText,
                            ),
                            icon: const Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              size: kIconSize,
                              color: ColorsApp.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserPointBanner extends StatelessWidget {
  final int points;
  const _UserPointBanner({
    super.key,
    required this.size,
    required this.points,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(k12Padding),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: k8Padding),
                      child: Text(
                        'Accumulated points',
                        style: TextStyles
                            .defaultStyle.sizeAppbar.colorAppBarText.semiBold,
                      ),
                    ),
                    Container(
                      width: size.width * 0.453,
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                          color: ColorsApp.statusNoteColor,
                          borderRadius: DecorationStyles.boxBorderRadiusMin),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(k8Padding),
                      child: Text(
                        "$points Point",
                        style: TextStyles
                            .defaultStyle.sizeHeading.colorYellowText.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: k12Padding,
          right: 0,
          child: HelperImage.loadFromAsset(
            HelperAssets.iconPromotion,
            height: size.height * 0.1,
            width: size.height * 0.1 + 1,
          ),
        ),
      ],
    );
  }
}

class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(k12Padding),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CardItemFunction(
              icon: FontAwesomeIcons.wallet,
              text: "Balance",
              color: ColorsApp.primaryColor,
            ),
            const VerticalDivider(
              color: ColorsApp.primaryColor,
              indent: 3,
              endIndent: 3,
              thickness: 1.5,
            ),
            CardItemFunction(
                icon: FontAwesomeIcons.qrcode,
                text: "QR Scan",
                color: ColorsApp.primaryColor,
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(QRScreen.routeName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRScreen(user: user),
                      ));
                }),
            const VerticalDivider(
              color: ColorsApp.primaryColor,
              indent: 3,
              endIndent: 3,
              thickness: 1.5,
            ),
            const CardItemFunction(
              icon: FontAwesomeIcons.creditCard,
              text: "Accounts",
              color: ColorsApp.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(k12Padding),
          decoration: const BoxDecoration(
            color: ColorsApp.backgroundLight,
            borderRadius: DecorationStyles.boxBorderRadiusMin,
            boxShadow: [DecorationStyles.boxShadowBlue],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: k8Padding,
              ),
              CircleAvatar(
                radius: kIconSize * 1.5,
                child: HelperImage.loadFromAsset(user.userAvatar,
                    radius: BorderRadius.circular(kBorderRadiusIcon)),
              ),
              const SizedBox(
                width: k8Padding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.userName!.toUpperCase(),
                      style: TextStyles
                          .defaultStyle.semiBold.sizeHeading.colorDefaultText),
                  const SizedBox(
                    width: k8Padding,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: user.userID));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: ColorsApp.statusSuccessColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  DecorationStyles.boxBorderRadiusMin),
                          content: Text("User ID Copied to Clipboard!"),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.userID,
                          style: TextStyles.defaultStyle.colorHintText,
                        ),
                        const SizedBox(
                          width: k8Padding / 2,
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
              const SizedBox(
                width: k8Padding,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserEditScreen(user: user),
                    )),
                child: const Icon(FontAwesomeIcons.penToSquare),
              )
            ],
          ),
        ),
      ),
    );
  }
}
