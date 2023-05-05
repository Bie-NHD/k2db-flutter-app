import 'package:flutter/material.dart';

import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

class TypicalProducts extends StatelessWidget {
  final Function() onTap;
  final String imgProduct;
  final String nameProduct;
  final double price;
  final double discountPrice;
  final double discountPercent;

  const TypicalProducts({
    Key? key,
    required this.onTap,
    required this.imgProduct,
    required this.nameProduct,
    required this.price,
    required this.discountPrice,
    required this.discountPercent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160,
          height: 140,
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
                width: 160,
                height: 64,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Container(
                width: 160,
                height: 74,
                padding: const EdgeInsets.all(k8Padding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: k12Padding,),
                    Text(
                      nameProduct,
                      style: TextStyles.defaultStyle.semiBold,
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: k12Padding/2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          price.toFormatMoney(),
                          style: TextStyles.defaultStyle.colorRedText,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: k12Padding*3/2,),
                        Text(
                          discountPrice.toFormatMoney(),
                          style: TextStyles.defaultStyle.colorRedText,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
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
        ),
      ],
    );
  }
}