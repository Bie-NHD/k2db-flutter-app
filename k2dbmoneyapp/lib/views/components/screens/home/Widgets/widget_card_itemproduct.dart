import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';

import '../../../../../core/constant/text.dart';
import '../../../../../core/extensions/extension_textstyle.dart';

class CardItemProduct extends StatelessWidget {
  final Function() onTap;
  final String imagePath;
  final String nameProduct;
  final double price;
  final double? discountPercent;

  const CardItemProduct({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.nameProduct,
    required this.price,
    this.discountPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double priceNew = price * (discountPercent! / 100);

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: k8Padding / 2, horizontal: k8Padding),
      child: Stack(
        children: [
          Container(
            height: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: ColorsApp.backgroundLight,
                borderRadius:
                    const BorderRadius.all(Radius.circular(kBorderRadiusMin)),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.backgroundDark.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.width * 0.25,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(k8Padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameProduct,
                        style: TextStyles.defaultStyle.semiBold.colorTitleText,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: k8Padding,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              priceNew.toFormatMoney(),
                              style: TextStyles.defaultStyle.colorRed,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Text(
                              price.toFormatMoney(),
                              style: TextStyles
                                  .defaultStyle.fontMin.colorHintText
                                  .copyWith(
                                decoration: TextDecoration.lineThrough,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Discount
          discountPercent != null
              ? Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(k8Padding / 2),
                    decoration: const BoxDecoration(
                        color: ColorsApp.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadiusMin),
                            bottomRight: Radius.circular(kBorderRadiusMin))),
                    child: Text(
                      "-$discountPercent%",
                      style: TextStyles.defaultStyle.fontMin.colorAppBarText,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
