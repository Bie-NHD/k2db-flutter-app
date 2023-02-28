import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../core/constant/color.dart';
import '../../core/constant/dimension.dart';
import '../../core/constant/text.dart';
import '../../core/widgets/icon_textlink.dart';

class Transaction_History extends StatelessWidget {
  final String title;
  final double price;
  final DateTime dateTime;
  final bool? isBuying;
  final double sizeIcon;
  final Function() onTap;
  const Transaction_History({Key? key, required this.dateTime, required this.title, required this.price, this.isBuying, required this.sizeIcon, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Row(
        children: [
          if(isBuying == true)...[
            const Icon(
              FontAwesomeIcons.store,
              size: kIconSize,
              color: ColorsApp.primaryColor,
            )
          ]else...[
            const SizedBox(width: kIconSize, height: kIconSize)
          ],
          const SizedBox(width: k8Margin),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime),
                style: TextStyles.defaultStyle.sizeTitleAndButton.colorHintText.regular,
              ),
              Text(title,
                style: TextStyles.defaultStyle.regular.sizeTitleAndButton.regular,
              )
            ],
          ),
          const Spacer(),
          Text(price.toFormatMoney(),
            style: TextStyles.defaultStyle.bold.sizeTitleAndButton.colorRedText,
          ),
          const SizedBox(width: k8Margin,),
          IconTextLink(title: '', onTap: () {}, sizeIcon: kIconSize,)
        ],
      ),
    );
  }
}