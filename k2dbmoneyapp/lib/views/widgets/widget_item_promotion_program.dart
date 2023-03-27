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
      child: Stack(
        children: [
          Positioned(
            top: k12Padding,
            left: k12Padding,
            child: Container(
              width: size.width*0.3,
              height: size.height*0.13,
              decoration: const BoxDecoration(
                color: ColorsApp.backgroundLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: k8Padding, right: k12Padding, bottom: k8Padding, ),
                child: HelperImage.loadFromAsset(
                  HelperAssets.iconOff50MyGift,
                ),
              ),
            ),
          ),
          Positioned(
            top: k12Padding,
            right: k12Padding,
            child: Container(
              width: size.width*0.67,
              height: size.height*0.13,
              decoration: const BoxDecoration(
                color: ColorsApp.backgroundLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(k8Padding, k8Padding/2, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textTitle,
                          style: TextStyles.defaultStyle.colorDefaultText.sizeAppbar.bold,
                        ),
                        const SizedBox(height: k8Padding),
                        Text(
                          textDescribe,
                          style: TextStyles.defaultStyle.colorDefaultText.sizeDefault.regular,
                        ),
                        const SizedBox(height: k8Padding),
                        Text(
                          textDate,
                          style: TextStyles.defaultStyle.colorDefaultText.sizeDefault.bold,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: k8Padding,
                    right: k8Padding,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onTapShare,
                          child: const Icon(
                            FontAwesomeIcons.shareNodes,
                            size: kIconSize - 2,
                          ),
                        ),
                        const SizedBox(width: k8Padding),
                        GestureDetector(
                          onTap: onTapHeart,
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            size: kIconSize - 2,
                            color: colorHeart,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: k8Padding/2,
                    child: TextButton(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}