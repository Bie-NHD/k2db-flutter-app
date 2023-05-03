import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

class ItemDetailExchangeGift extends StatelessWidget {
  final String nameGift;
  final String giftExpirationDate;
  final String priceGift;
  final String giftDetail;
  final String conditionsOfUse;

  const ItemDetailExchangeGift({
    Key? key,
    required this.nameGift,
    required this.giftExpirationDate,
    required this.priceGift,
    required this.giftDetail,
    required this.conditionsOfUse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: k12Padding, right: k12Padding, left: k12Padding),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsApp.backgroundLight,
              borderRadius: BorderRadius.circular(k12Padding),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameGift,
                  style: TextStyles.defaultStyle.sizeHeading.colorHeadingText.semiBold,
                ),
                const SizedBox(height: k8Padding,),
                Text(
                  giftExpirationDate,
                  style: TextStyles.defaultStyle.sizeDefault.colorHeadingText.extraLight,
                ),
                Container(
                    margin: const EdgeInsets.only(top: k12Padding, right: k12Padding, left: k12Padding),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(k12Padding),
                    ),
                    child:Column(
                      children: [
                        const SizedBox(height: k12Padding,),
                        const Icon(
                          FontAwesomeIcons.medal,
                          size: kIconSize + k24Padding,
                          color: ColorsApp.secondaryColor,
                        ),
                        const SizedBox(height: k8Padding,),
                        Text(
                          'Point used to require',
                          style: TextStyles.defaultStyle.sizeDefault.colorHeadingText.regular,
                        ),
                        const SizedBox(height: k8Padding/2,),
                        Text(
                          priceGift,
                          style: TextStyles.defaultStyle.sizeDefault.colorYellowText.bold,
                        ),
                        const SizedBox(height: k8Padding/2,),
                      ],
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: k12Padding, right: k12Padding, left: k12Padding),
                      child: Text(
                        'Chi tiết quà tặng',
                        style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.bold,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: k8Padding/2, right: k12Padding, left: k12Padding),
                      child: Text(
                        giftDetail,
                        style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.regular,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: k8Padding/2, right: k12Padding, left: k12Padding),
                      child: Text(
                        'Điều kiện sử dụng',
                        style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.bold,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: k8Padding/2, right: k12Padding, left: k12Padding),
                      child: Text(
                        conditionsOfUse,
                        style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.regular,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: k12Padding,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}