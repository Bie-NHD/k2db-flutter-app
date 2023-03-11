import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_card_function_filled.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';
import '../../../../../core/constant/text.dart';

class UserNavigator extends StatefulWidget {
  final double userBalance;
  bool isShowingBalance;
  int len;

  UserNavigator({
    super.key,
    required this.userBalance,
    required this.isShowingBalance,
  }) : len = userBalance.toFormatMoney().toString().length;

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
              Text(
                widget.isShowingBalance
                    ? (widget.userBalance).toFormatMoney()
                    : (widget.userBalance)
                        .toFormatMoney()
                        .toString()
                        .replaceRange(0, widget.len, "*" * widget.len),
                style: TextStyle(
                    fontWeight: TextStyles.defaultStyle.bold.fontWeight,
                    fontSize: TextStyles.defaultStyle.sizeHeading.fontSize),
              )
            ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: k8Padding),
                    child: e,
                  ),
                )
                .toList(),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(k8Padding),
                      child: e,
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
