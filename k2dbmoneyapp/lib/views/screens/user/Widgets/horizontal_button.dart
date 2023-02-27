// TODO Refactor Widget Duplicate

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

class HorizontalButtonLink extends StatelessWidget {
  IconData? icon;
  final String text;

  HorizontalButtonLink({Key? key, this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width - 24,
        margin: const EdgeInsets.only(top: k12Margin),
        padding: const EdgeInsets.symmetric(
            vertical: k12Padding, horizontal: k24Padding),
        decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            border: Border.all(color: ColorsApp.secondaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(kBorderRadiusMin)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: ColorsApp.backgroundDark,
              size: kIconSize * 1.1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: k8Padding),
              child: Text(
                text,
                style: TextStyles.defaultStyle.regular,
              ),
            ),
            Spacer(),
            const Icon(
              FontAwesomeIcons.angleRight,
              size: kIconSize,
            )
          ],
        ),
      ),
    );
  }
}
