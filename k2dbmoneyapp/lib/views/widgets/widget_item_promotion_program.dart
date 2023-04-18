import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../core/helpers/helper_asset.dart';
import '../../core/helpers/helper_image.dart';

class ItemPromotionProgram extends StatelessWidget {
  final Function() onTap;
  final Function() onTapShare;
  final Function() onTapHeart;
  final String textTitle;
  final String textDescribe;
  final String textDate;
  final Color? colorHeart;

  const ItemPromotionProgram({
    Key? key,
    required this.onTap,
    required this.onTapShare,
    required this.onTapHeart,
    required this.textTitle,
    required this.textDescribe,
    required this.textDate,
    this.colorHeart,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: k12Padding, left: k12Padding, top: k12Padding, bottom: 0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            borderRadius: BorderRadius.circular(k12Padding),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: HelperImage.loadFromAsset(
                  HelperAssets.iconOff50MyGift,
                ),
              ),
              Container(
                color: ColorsApp.hintTextColor,
                width: k8Padding/4,
              ),
              const SizedBox(width: k8Padding,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: k8Padding/2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            textTitle,
                            style: TextStyles.defaultStyle.colorDefaultText.sizeAppbar.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: k8Padding),
                            GestureDetector(
                              onTap: onTapHeart,
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                size: kIconSize - 2,
                                color: colorHeart,
                              ),
                            ),
                            const SizedBox(width: k8Padding),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: k8Padding),
                    Text(
                      textDescribe,
                      style: TextStyles.defaultStyle.colorDefaultText.sizeDefault.regular,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDate,
                          style: TextStyles.defaultStyle.colorDefaultText.sizeDefault.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/store_screen");
                            // Do something when button is pressed
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Dùng Ngay',
                            style: TextStyles.defaultStyle.colorDeepBlueText.sizeTitleAndButton.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}