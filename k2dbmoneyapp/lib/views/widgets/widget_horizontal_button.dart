import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../core/constant/color.dart';
import '../../core/constant/dimension.dart';
import '../../core/constant/text.dart';
import '../../core/widgets/widget_itembutton.dart';

class HorizontalButtonLinkOutline extends ButtonOutline {
  final IconData? icon;
  final Alignment? alignment;
  const HorizontalButtonLinkOutline(
      {Key? key,
      this.icon,
      required super.text,
      super.color,
      super.onTap,
      super.width,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        width: width ?? MediaQuery.of(context).size.width - 24,
        margin: const EdgeInsets.only(top: k12Margin),
        padding: const EdgeInsets.symmetric(
            vertical: k12Padding, horizontal: k24Padding),
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
            border:
                Border.all(color: color ?? ColorsApp.tertiaryColors, width: 1),
            borderRadius: BorderRadius.circular(kBorderRadiusMin)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: ColorsApp.defaultTextColor,
              size: kIconSize,
            ),
            Padding(
              padding: const EdgeInsets.only(left: k8Padding),
              child: Text(
                text,
                style: TextStyles.defaultStyle.semiBold.sizeTitleAndButton,
              ),
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.angleRight,
              size: kIconSize,
              color: ColorsApp.tertiaryColors,
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalButtonLinkFill extends ButtonFill {
  final IconData? icon;
  final Alignment? alignment;

  const HorizontalButtonLinkFill(
      {Key? key,
      this.icon,
      required super.text,
      super.color,
      required super.onTap,
      super.width,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        width: width ?? MediaQuery.of(context).size.width - 24,
        margin: const EdgeInsets.only(top: k12Margin),
        padding: const EdgeInsets.symmetric(
            vertical: k12Padding, horizontal: k24Padding),
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
            color: color ?? ColorsApp.tertiaryColors,
            borderRadius: BorderRadius.circular(kBorderRadiusMin)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: ColorsApp.defaultTextColor,
              size: kIconSize,
            ),
            Padding(
              padding: const EdgeInsets.only(left: k8Padding),
              child: Text(
                text,
                style: TextStyles.defaultStyle.semiBold.sizeTitleAndButton,
              ),
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.angleRight,
              size: kIconSize,
              color: ColorsApp.appBarTextColor,
            )
          ],
        ),
      ),
    );
  }
}
