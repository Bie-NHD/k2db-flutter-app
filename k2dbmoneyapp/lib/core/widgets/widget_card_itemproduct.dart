import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../helpers/helper_asset.dart';

class CardItemProduct extends StatelessWidget {
  final Function() onTap;
  final String imgProduct;
  final String nameProduct;
  final String imgStore;
  final String nameStore;
  final double price;
  final int quantity;
  final double? discountPercent;

  const CardItemProduct({
    Key? key,
    required this.onTap,
    required this.nameProduct,
    this.discountPercent,
    required this.price,
    required this.imgProduct,
    required this.imgStore,
    required this.nameStore,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ColorsApp.backgroundLight,
              borderRadius: BorderRadius.circular(kBorderRadiusMin),
              border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
            ),
            child: Column(
              children: [
                Image.asset(
                  imgProduct,
                  width: double.maxFinite,
                  height: 100,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(k8Padding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameProduct,
                        style: TextStyles.defaultStyle.semiBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: k8Padding / 2,
                      ),
                      Row(
                        children: [
                          HelperImage.loadFromAsset(
                            HelperAssets.logoBrandStore,
                            width: k24Padding,
                            height: k24Padding,
                            radius: BorderRadius.circular(kBorderRadiusMax),
                          ),
                          const SizedBox(
                            width: k8Padding / 2,
                          ),
                          Expanded(
                            child: Text(
                              nameStore,
                              style: TextStyles.defaultStyle.sizeMin.semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: k8Padding / 2,
                      ),
                      Text(
                        price.toFormatMoney(),
                        style: TextStyles.defaultStyle.colorRedText,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: k8Padding / 2),
                      Text(
                        "Kho: $quantity",
                        style: TextStyles.defaultStyle.sizeMin.colorHintText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          discountPercent != null
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: k8Padding / 4, horizontal: k8Padding / 2),
                    decoration: const BoxDecoration(
                        color: ColorsApp.statusErrorColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadiusMin),
                          bottomRight: Radius.circular(kBorderRadiusMin),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: ColorsApp.backgroundLight,
                            blurRadius: 4,
                          )
                        ]),
                    child: Text(
                      "-$discountPercent%",
                      style: TextStyles.defaultStyle.colorAppBarText,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
