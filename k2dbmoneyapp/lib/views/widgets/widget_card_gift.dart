import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

class CardGift extends StatelessWidget {
  final String titleGift;
  final String timeGift;
  final String giftDetailTime;
  final String giftDetailObject;
  final String giftDetailGift;
  final String giftDescription;
  final String usingGift;


  const CardGift({
    Key? key,
    required this.titleGift,
    required this.timeGift,
    required this.giftDetailTime,
    required this.giftDetailObject,
    required this.giftDetailGift,
    required this.giftDescription,
    required this.usingGift,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: size.height* 0.3,
          width: size.width * 1,
          margin: const EdgeInsets.all(k12Margin),
          padding: const EdgeInsets.all(k8Padding),
          decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleGift,
                style: TextStyles.defaultStyle.sizeAppbar.colorDefaultText.bold,
              ),
              const Divider(
                color: ColorsApp.hintTextColor,
                thickness: 1,
              ),
              Text(
                timeGift,
                style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.extraLight,
              ),
            ],
          ),
        ),
        Container(
          // height: size.height* 0.3,
          width: size.width * 1,
          margin: const EdgeInsets.only(
              left: k12Padding, right: k12Padding),
          padding: const EdgeInsets.all(k12Padding),
          decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Chi tiết chương trình',
                style: TextStyles.defaultStyle.sizeAppbar.colorDefaultText
                    .bold,
              ),
              const Divider(
                color: ColorsApp.hintTextColor,
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.circleDot,
                    size: kIconSize - 8,
                  ),
                  const SizedBox(width: k8Padding),
                  Expanded(
                    child: Text(
                      giftDetailTime,
                      style: TextStyles.defaultStyle.sizeTitleAndButton
                          .colorDefaultText.regular,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.circleDot,
                    size: kIconSize - 8,
                  ),
                  const SizedBox(width: k8Padding),
                  Expanded(
                    child: Text(
                      giftDetailObject,
                      style: TextStyles.defaultStyle.sizeTitleAndButton
                          .colorDefaultText.regular,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.circleDot,
                    size: kIconSize - 8,
                  ),
                  const SizedBox(width: k8Padding),
                  Expanded(
                    child: Text(
                      giftDetailGift,
                      style: TextStyles.defaultStyle.sizeTitleAndButton
                          .colorDefaultText.regular,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: ColorsApp.hintTextColor,
                thickness: 1,
              ),
              Text(
                'Quà tặng',
                style: TextStyles.defaultStyle.sizeAppbar.colorDefaultText
                    .bold,
              ),
              Text(
                giftDescription,
                style: TextStyles.defaultStyle.sizeDefault
                    .colorDefaultText.regular,
              ),
              Text(
                'Hướng dẫn sử dụng ưu đãi',
                style: TextStyles.defaultStyle.sizeAppbar.colorDefaultText
                    .bold,
              ),
              Text(
                usingGift,
                style: TextStyles.defaultStyle.sizeDefault
                    .colorDefaultText.regular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}