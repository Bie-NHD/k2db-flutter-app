import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimension.dart';
import '../../../../../core/extensions/extension_string.dart';

class CardItemForYou extends StatelessWidget {
  final String imagePath;
  final String nameProduct;
  final String price;
  const CardItemForYou(
      {Key? key,
      required this.imagePath,
      required this.nameProduct,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.2,
      padding: const EdgeInsets.all(k8Padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.backgroundDark,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(k12Padding)),
        color: ColorsApp.hintTextColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: k12Padding,
          ),
          Text(
            nameProduct,
            style: TextStyles.defaultStyle.semiBold,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            price,
            style: TextStyles.defaultStyle.colorRed,
          )
        ],
      ),
    );
  }
}
