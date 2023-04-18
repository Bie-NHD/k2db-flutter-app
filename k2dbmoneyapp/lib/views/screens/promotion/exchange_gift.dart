import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import '../../../core/helpers/helper_asset.dart';
import '../../../core/helpers/helper_image.dart';
import '../../widgets/widget_item_exchange_gift.dart';

class ExchangeGiftScreen extends StatefulWidget {
  const ExchangeGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/exchange_gift_screen";

  @override
  State<ExchangeGiftScreen> createState() => _ExchangeGiftScreenState();
}

class _ExchangeGiftScreenState extends State<ExchangeGiftScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text('Exchange Gift',
            style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.bold
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(k12Padding),
            onPressed: () {
              Navigator.of(context).pushNamed("/help_promotion_screen");
            },
            icon: const Icon(
              FontAwesomeIcons.solidCircleQuestion,
              size: kIconSize - 2,
            ),
            tooltip: "Help",
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(k12Padding),
            child: Container(
              padding: const EdgeInsets.all(k8Padding/2),
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  HelperImage.loadFromAsset(
                    HelperAssets.iconMedalExChangeGift,
                    height: size.height * 0.09,
                    width: size.height * 0.09,
                  ),
                  const SizedBox(width: k8Padding/2,),
                  SizedBox(
                    width: k8Padding / 2 - 2,
                    child: Container(
                      color: ColorsApp.backgroundLight,
                      height: size.height * 0.09,
                    ),
                  ),
                  const SizedBox(width: k8Padding/2,),
                  SizedBox(
                    height: size.height * 0.09,
                    child: Padding(
                      padding: const EdgeInsets.all(k8Padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Phạm Quốc Khánh',
                            style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText.semiBold,
                          ),
                          Text(
                            "7.000.000.000 Point",
                            style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: k12Padding, left: k12Padding),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.ribbon),
                    Text(
                      'Information',
                      style: TextStyles.defaultStyle.sizeAppbar.colorHeadingText.bold,
                    ),
                  ],
                ),
                const SizedBox(height: k8Padding/2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        'Instructions to accumulate points',
                        style: TextStyles.defaultStyle.sizeDefault.colorHeadingText.regular,
                    ),
                    InkWell(
                      onTap: () {
                        // Do something when button is pressed
                      },
                      child: const Icon(
                        FontAwesomeIcons.chevronRight,
                        size: k24Padding,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: k8Padding/2,),
                Container(
                  color: ColorsApp.backgroundDark,
                  height: k8Padding/2 -3,
                ),
                const SizedBox(height: k8Padding/2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Instructions to accumulate points',
                      style: TextStyles.defaultStyle.sizeDefault.colorHeadingText.regular,
                    ),
                    InkWell(
                      onTap: () {
                        // Do something when button is pressed
                      },
                      child: const Icon(
                        FontAwesomeIcons.chevronRight,
                        size: k24Padding,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: k8Padding/2,),
              ],
            ),
          ),
          Container(
            color: ColorsApp.hintTextColor,
            height: k8Padding/2 -1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: k8Padding, right: k8Padding, top: k8Padding),
            child: Column(
              children: [
                Text(
                  'Endow',
                  style: TextStyles.defaultStyle.sizeAppbar.colorHeadingText.bold,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: k12Padding,
              mainAxisSpacing: k12Padding,
              padding: const EdgeInsets.all(k12Padding),
              childAspectRatio: 1,
              children: List.generate(
                15,
                    (index) => ItemExchangeGift(
                  imgGift: HelperAssets.iconThitHeo,
                  nameGift: 'Thịt Heo siêu nạt',
                  priceGift: '10000 Point',
                      onTap: () {
                        Navigator.of(context).pushNamed("/help_promotion_screen");
                      },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}