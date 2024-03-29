import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../core/helpers/helper_asset.dart';
import '../../core/helpers/helper_image.dart';

class Onboard {
  final String imgOnboard, titleOnboard, descOnboard;

  Onboard({
    required this.imgOnboard,
    required this.titleOnboard,
    required this.descOnboard,
  });
}

final List<Onboard> onboard = [
  Onboard(
      imgOnboard: HelperAssets.onBoard1,
      titleOnboard: 'Welcome to K2DB Money',
      descOnboard:
          'Simple and secure way to send, spend, and manage your money. Automatic payment when shopping at the store'),
  Onboard(
      imgOnboard: HelperAssets.onBoard2,
      titleOnboard: 'Save your time and money',
      descOnboard:
          'Save time paying at the store. Recommend suitable goods at the store and let you know the right products for you'),
  Onboard(
      imgOnboard: HelperAssets.onBoard3,
      titleOnboard: 'Spending management',
      descOnboard:
          'Manage and check transactions. Lets you know the shopping receipts and income and expenditure reports that you use during the month'),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {Key? key,
      required this.imgOnboard,
      required this.titleOnboard,
      required this.descOnboard})
      : super(key: key);

  final String imgOnboard, titleOnboard, descOnboard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "K2DB Money",
            style: TextStyles.defaultStyle.bold.sizeHeading.colorDeepBlueText,
          ),
          const Spacer(),
          HelperImage.loadFromAsset(imgOnboard, height: 300),
          const Spacer(),
          Text(titleOnboard,
              style: TextStyles.defaultStyle.sizeHeading.bold,
              textAlign: TextAlign.center),
          const SizedBox(height: k12Padding),
          Text(descOnboard,
              style: TextStyles.defaultStyle, textAlign: TextAlign.center),
          const Spacer(),
        ],
      ),
    );
  }
}
