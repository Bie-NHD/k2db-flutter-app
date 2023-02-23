import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../constant/text.dart';

class ItemButtonFillWidget extends StatelessWidget {
  const ItemButtonFillWidget(
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
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.defaultStyle.fontTitleAndButton.colorAppBarText,
        ),
      ),
    );
  }
}
