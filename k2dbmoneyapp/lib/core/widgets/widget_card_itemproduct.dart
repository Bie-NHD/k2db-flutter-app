import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../helpers/helper_asset.dart';

class CardItemProduct extends StatelessWidget {
  const CardItemProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: k8Padding, horizontal: k12Padding),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/detail_product");
        },
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
                      offset: const Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 6,
                    ),
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    HelperAssets.product,
                    width: double.maxFinite,
                    height: 100,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: k8Padding / 2, horizontal: k8Padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lê Hàn Quốc siêu rẻ, siêu ngon bao ăn",
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
                            Text(
                              "Bách Hoá Xanh",
                              style: TextStyles.defaultStyle.sizeMin,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: k8Padding / 2,
                        ),
                        Text(
                          12341512.0.toFormatMoney(),
                          style: TextStyles.defaultStyle.colorRedText,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Kho: 12,5k",
                          style: TextStyles.defaultStyle.sizeMin.colorHintText,
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
                      vertical: k8Padding / 4, horizontal: k8Padding),
                  decoration: const BoxDecoration(
                    color: ColorsApp.statusErrorColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadiusMin),
                      bottomRight: Radius.circular(kBorderRadiusMin),
                    ),
                  ),
                  child: Text(
                    "-50%",
                    style: TextStyles.defaultStyle.colorAppBarText,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
