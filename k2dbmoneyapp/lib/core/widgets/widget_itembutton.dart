import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../constant/text.dart';

class ButtonFill extends StatelessWidget {
  const ButtonFill(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.width})
      : super(key: key);

  final String text;
  final Function() onTap;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: k12Padding),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.defaultStyle.sizeTitleAndButton.colorAppBarText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  const ButtonOutline(
      {Key? key, required this.text, this.onTap, this.color, this.width})
      : super(key: key);

  final String text;
  final Function()? onTap;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: k12Padding),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: color ?? ColorsApp.primaryColor),
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.defaultStyle.sizeTitleAndButton.colorHeadingText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
