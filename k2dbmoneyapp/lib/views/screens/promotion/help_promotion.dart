import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text('Help',
          style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(k16Padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "   ❖ Step 1: Link your bank card to enable automatic payment when purchasing products",
              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: k12Padding),
            Text(
              "   ❖ Step 2: Go to the store and choose the products you want to buy.",
              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: k12Padding),
            Text(
              "   ❖ Step 3: The system will automatically recognize and pay the bill for you.",
              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: k12Padding),
            Text(
              "   ❖ Step 4: However, while the system recognizes and processes your payment issues, if your account has a discount code or promotion program applied, the system will automatically apply the discount according to the program promotion.",
              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: k12Padding),
            Text(
              "   ❖ Step 5: When the payment is successfully made, you will receive 1% of the total amount you spent to purchase goods at the store as points.",
              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}