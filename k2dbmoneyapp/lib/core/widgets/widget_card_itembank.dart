import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../constant/color.dart';
import '../constant/dimension.dart';
import '../constant/text.dart';
import '../helpers/helper_image.dart';

class CardItemBank extends StatelessWidget {
  final String imgBank;
  final String nameBank;
  final bool? isChoosen;

  CardItemBank(
      {Key? key,
      required this.imgBank,
      required this.nameBank,
      this.isChoosen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: k8Margin),
      padding: const EdgeInsets.all(k12Padding),
      decoration: BoxDecoration(
          color: ColorsApp.backgroundLight,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
          border: Border.all(color: ColorsApp.tertiaryColors)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HelperImage.loadFromAsset(imgBank,
              width: k24Padding,
              height: k24Padding,
              radius: BorderRadius.circular(kBorderRadiusMax)),
          const SizedBox(width: k8Padding),
          Text(
            nameBank,
            style: TextStyles.defaultStyle.sizeTitleAndButton.semiBold,
          )
        ],
      ),
    );
  }
}
