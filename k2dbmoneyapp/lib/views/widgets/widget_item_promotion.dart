import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

class ItemPromotion extends StatelessWidget {
  final IconData icon;
  final String nameItem;
  final String describeItem;
  final Color? color;
  const ItemPromotion(
      {Key? key,
        required this.icon,
        required this.nameItem,
        required this.describeItem,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: k12Padding),
      child: Column(
        children: [
          Container(
            width: 173,
            height: 64,
            decoration: BoxDecoration(
              color: ColorsApp.backgroundLight,
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: k8Padding,
                  left: k8Padding,
                  child: Text(
                    nameItem,
                    style: TextStyle(
                      fontSize: TextStyles
                          .defaultStyle.sizeDefault.fontSize,
                      fontWeight:
                      TextStyles.defaultStyle.bold.fontWeight,
                      color: ColorsApp.defaultTextColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: k8Padding,
                  left: k8Padding,
                  child: Text(
                    describeItem,
                    style: TextStyle(
                      fontSize:
                      TextStyles.defaultStyle.sizeMin.fontSize,
                      fontWeight: TextStyles
                          .defaultStyle.extraLight.fontWeight,
                      color: ColorsApp.defaultTextColor,
                    ),
                  ),
                ),
                Positioned(
                  top: k8Padding,
                  right: k8Padding,
                  child: Icon(
                    icon,
                    size: kIconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
