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
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidCircleQuestion,
              size: kIconSize - 2,
            ),
            tooltip: "Help",
          )
        ],
      ),
    );
  }
}