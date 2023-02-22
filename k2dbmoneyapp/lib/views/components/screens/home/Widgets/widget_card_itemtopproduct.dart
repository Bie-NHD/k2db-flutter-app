import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';
import '../../../../../core/constant/text.dart';
import '../../../../../core/extensions/extension_textstyle.dart';

class CardItemTopProduct extends StatelessWidget {
  final String imagePath;
  final String nameProduct;
  final String price;
  const CardItemTopProduct(
      {Key? key,
      required this.imagePath,
      required this.nameProduct,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(k8Padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.backgroundDark,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadiusMin)),
        color: ColorsApp.hintTextColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(
            nameProduct,
            style: TextStyles.defaultStyle.semiBold,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            price,
            style: TextStyles.defaultStyle.colorRed,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
