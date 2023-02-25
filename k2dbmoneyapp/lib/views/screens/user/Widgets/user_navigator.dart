import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/user_navi_button.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';
import '../../../../../core/constant/text.dart';

class UserNavigator extends StatefulWidget {
  String userBalance;
  String currencySym;
  bool isShowingBalance;

  UserNavigator(
      {super.key,
      required this.userBalance,
      required this.currencySym,
      required this.isShowingBalance});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                width: k8Padding,
              ),
              Text(
                widget.isShowingBalance
                    ? "${widget.userBalance} ${widget.currencySym}"
                    : "${widget.userBalance.replaceRange(0, widget.userBalance.length, "*" * widget.userBalance.length)} ${widget.currencySym}",
                style: TextStyle(
                    fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                    fontSize: TextStyles.defaultStyle.sizeHeading.fontSize),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    UserNaviButton(
                      icon: FontAwesomeIcons.wallet,
                      text: "Balance",
                    ),
                    UserNaviButton(
                      icon: FontAwesomeIcons.qrcode,
                      text: "QR Scan",
                    ),
                    UserNaviButton(
                      icon: FontAwesomeIcons.moneyCheck,
                      text: "Bank",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
