import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

class HelpPromotionScreen extends StatefulWidget {
  const HelpPromotionScreen({Key? key}) : super(key: key);
  static const routeName = "/help_promotion_screen";

  @override
  State<HelpPromotionScreen> createState() => _HelpPromotionScreenState();
}

class _HelpPromotionScreenState extends State<HelpPromotionScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
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
    );
  }
}