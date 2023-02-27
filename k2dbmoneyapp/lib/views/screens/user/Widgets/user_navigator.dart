import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_card_function_filled.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';
import '../../../../../core/constant/text.dart';

class UserNavigator extends StatefulWidget {
  final String userBalance;
  final String currencySym;
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
