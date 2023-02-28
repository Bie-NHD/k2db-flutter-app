import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';

import '../constant/text.dart';

class IconTextLink extends StatelessWidget {
  final String title;
  final double? sizeIcon;
  final Function() onTap;
  const IconTextLink({Key? key, this.sizeIcon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.defaultStyle,
          ),
          const SizedBox(
            width: k8Padding / 2,
          ),
          Icon(
            FontAwesomeIcons.angleRight,
            size: sizeIcon?? kIconSize / 2,
            color: ColorsApp.backgroundDark,
          ),
        ],
      ),
    );
  }
}
