import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import '../../../core/extensions/extension_textstyle.dart';

class CardItemTopProduct extends StatelessWidget {
  final String? imagePath;
  final String? nameProduct;
  final double? price;
  const CardItemTopProduct(
      {Key? key, this.imagePath, this.nameProduct, this.price})
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
            imagePath ?? "",
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(
            nameProduct ?? "No name",
            style: TextStyles.defaultStyle.semiBold,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            price == 0.0 ? 0.0.toFormatMoney() : price!.toFormatMoney(),
            style: TextStyles.defaultStyle.colorRedText,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
