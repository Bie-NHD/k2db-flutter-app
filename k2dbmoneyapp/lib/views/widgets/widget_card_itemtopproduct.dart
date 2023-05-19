// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import '../../../core/extensions/extension_textstyle.dart';

class CardItemTopProduct extends StatelessWidget {
  final String? imagePath;
  final String? nameProduct;
  final double price;

  const CardItemTopProduct(
      {Key? key, this.imagePath, this.nameProduct, this.price = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // padding: const EdgeInsets.all(k8Padding),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadiusMin)),
        color: ColorsApp.secondaryColor.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imagePath != null
              ? HelperImage.loadFromAsset(
                  imagePath!,
                  width: double.maxFinite,
                  height: 80,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )
              : const LoadingPlaceholder(),
          Padding(
            padding: const EdgeInsets.all(k8Padding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  price == 0.0 ? 0.0.toFormatMoney() : price!.toFormatMoney(),
                  style: TextStyles
                      .defaultStyle.colorRedText.semiBold.sizeTitleAndButton,
                  overflow: TextOverflow.visible,
                ),
                Text(
                  nameProduct ?? "No name",
                  style: TextStyles.defaultStyle.semiBold,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingPlaceholder extends StatelessWidget {
  final double padding;
  final Color? color;

  const LoadingPlaceholder({
    super.key,
    this.padding = k12Padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? k12Padding),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.spinner,
            color: color ?? ColorsApp.tertiaryColors,
          ),
          Text(
            "Loading...",
            style: TextStyles.defaultStyle.colorGrayText,
          )
        ],
      ),
    );
  }
}
