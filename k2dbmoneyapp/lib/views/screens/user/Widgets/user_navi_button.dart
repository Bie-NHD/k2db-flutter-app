import 'package:flutter/cupertino.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';

class UserNaviButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const UserNaviButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(k8Margin),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                color: ColorsApp.defaultTextColor,
                borderRadius: BorderRadius.circular(kBorderRadiusMin)),
            child: Icon(
              icon,
              color: ColorsApp.secondaryColor,
              size: kIconSize * 1.8,
            ),
          ),
        ),
        Text(
          text.toUpperCase(),
          style: TextStyles.defaultStyle.bold,
        )
      ],
    );
  }
}
