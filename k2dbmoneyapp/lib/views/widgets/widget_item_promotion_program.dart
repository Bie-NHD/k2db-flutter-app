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
  final Function() onTapHeart;
  final String textTitle;
  final String textDescribe;
  final String textDate;
  final Color? colorHeart;

  const ItemPromotionProgram({
    Key? key,
    required this.onTap,
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
        padding: const EdgeInsets.only(right: k12Padding, left: k12Padding, top: k12Padding),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.backgroundLight,
            borderRadius: BorderRadius.circular(k12Padding),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(k12Padding),
                ),
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
                  mainAxisAlignment: MainAxisAlignment.end,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          "HSD: $textDate",
                          style: TextStyles.defaultStyle.colorDefaultText.sizeDefault.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.7,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: Colors.black,
                                      ),
                                    ),
                                    AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        'You have successfully used it!',
                                        style: TextStyles.defaultStyle.sizeTitleAndButton.colorDefaultText.bold,
                                      ),
                                      content: Text(
                                        'The discounted amount will be automatically deducted from your total payment invoice at the store! Thank you for using our shopping service at our store! Thank you! See you again!',
                                        style: TextStyles.defaultStyle.sizeDefault.colorDefaultText.regular,
                                        textAlign: TextAlign.justify,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
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