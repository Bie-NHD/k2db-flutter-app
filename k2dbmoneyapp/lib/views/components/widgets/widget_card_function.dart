import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';

import '../../../core/constant/text.dart';
import '../../../core/extensions/extension_textstyle.dart';

class CardItemFunction extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  final Color? color;
  const CardItemFunction(
      {Key? key,
      required this.icon,
      required this.text,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: kIconSize,
            color: color,
          ),
          const SizedBox(height: k8Padding),
          Text(
            text,
            style: TextStyles.defaultStyle.semiBold,
          ),
        ],
      ),
    );
  }
}
