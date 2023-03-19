
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
  final String? title;
  final double price;
  final DateTime dateTime;
  final bool? isBuying;
  final Function() onTap;
  const Transaction_History({Key? key, required this.dateTime, this.title, required this.price, this.isBuying, required this.onTap})
      : super(key: key);
  getStateIsBuying() => isBuying;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child:  Column(
        children: [
          const Divider(
            height: 0,
            thickness: k8Padding / 4,
            indent: 0,
            endIndent: k12Padding,
          ),
          const SizedBox(height: k8Margin),
          Row(
            children: [
              (isBuying??false) ? const Icon(
                    FontAwesomeIcons.store,
                    size: kIconSize,
                    color: ColorsApp.primaryColor,
                  ) : const SizedBox(width: kIconSize, height: kIconSize),
              const SizedBox(width: k14Padding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime),
                    style: TextStyles.defaultStyle.sizeTitleAndButton.colorHintText.regular,
                  ),
                  SizedBox(
                    width: size.width * 0.55,
                    child: Text(title ?? '...',
                      style: TextStyles.defaultStyle.regular.sizeTitleAndButton.regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: k8Margin),
                ],
              ),
              const Spacer(),
              Text(price.toFormatMoney(),
                style: TextStyles.defaultStyle.bold.sizeTitleAndButton.colorRedText,
              ),
              const SizedBox(width: k8Margin / 2),
              IconTextLink(title: '', onTap: () {}, sizeIcon: kIconSize,)
            ],
          ),
        ],
      ),
    );
  }
}

// Puschase History

// ignore: camel_case_types



