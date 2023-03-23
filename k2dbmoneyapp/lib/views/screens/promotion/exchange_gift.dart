import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

class ExchangeGiftScreen extends StatefulWidget {
  const ExchangeGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/exchange_gift_screen";

  @override
  State<ExchangeGiftScreen> createState() => _ExchangeGiftScreenState();
}

class _ExchangeGiftScreenState extends State<ExchangeGiftScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text('Exchange Gift',
            style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.bold
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(k12Padding),
            onPressed: () {
              Navigator.of(context).pushNamed("/help_promotion_screen");
            },
            icon: const Icon(
              FontAwesomeIcons.solidCircleQuestion,
              size: kIconSize - 2,
            ),
            tooltip: "Help",
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(k16Padding),
        color: ColorsApp.backgroundLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This function is temporarily not supported, please come back!',
              textAlign: TextAlign.center,
              style: TextStyles.defaultStyle.sizeHeading.colorDefaultText.bold.copyWith(
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: k16Padding),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle button press event
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primaryColor),
              ),
              child: Text(
                'Return',
                style: TextStyles.defaultStyle.sizeTitleAndButton.colorAppBarText.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}