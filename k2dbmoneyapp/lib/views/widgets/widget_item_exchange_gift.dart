import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

class ItemExchangeGift extends StatelessWidget {
  final Function() onTap;
  final String imgGift;
  final String nameGift;
  final String priceGift;

  const ItemExchangeGift({
    Key? key,
    required this.imgGift,
    required this.nameGift,
    required this.priceGift,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: ColorsApp.backgroundLight,
        borderRadius: BorderRadius.circular(kBorderRadiusMin),
        border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imgGift,
            width: double.maxFinite,
            height: 120,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(left: k8Padding, right: k8Padding, top: k8Padding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      nameGift,
                      style: TextStyles.defaultStyle.semiBold,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: k8Padding / 2,
                    ),
                    Text(
                      priceGift,
                      style: TextStyles.defaultStyle.colorYellowText.bold,
                      maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: const Icon(
                        FontAwesomeIcons.chevronRight,
                        size: k24Padding,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}