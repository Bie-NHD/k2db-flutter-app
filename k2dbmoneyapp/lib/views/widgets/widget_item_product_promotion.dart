import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

class ItemProductPromotion extends StatelessWidget {
  final Function() onTap;
  final String imgProduct;
  final String namePromotion;
  final String timePromotion;

  final double? discountPercent;

  const ItemProductPromotion({
    Key? key,
    required this.onTap,
    required this.namePromotion,
    required this.timePromotion,
    this.discountPercent,
    required this.imgProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: k12Padding, left: k12Padding, bottom: k8Padding/2),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusMin),
                  color: ColorsApp.backgroundLight,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.backgroundDark.withOpacity(0.25),
                      offset: const Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    imgProduct,
                    width: double.maxFinite,
                    height: size.height * 0.219,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: k8Padding, horizontal: k8Padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namePromotion,
                          style: TextStyles.defaultStyle.semiBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: k8Padding / 2,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: k8Padding / 2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: k8Padding / 2,
                        ),
                        Text(
                          timePromotion,
                          style: TextStyles.defaultStyle.sizeMin.colorHintText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}