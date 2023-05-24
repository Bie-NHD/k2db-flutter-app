import 'package:flutter/material.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_exchange_gift.dart';

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
            style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.bold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(k12Padding),
            child: Container(
              padding: const EdgeInsets.all(k8Padding / 2),
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
                  const SizedBox(
                    width: k8Padding / 2,
                  ),
                  SizedBox(
                    width: k8Padding / 2 - 2,
                    child: Container(
                      color: ColorsApp.backgroundLight,
                      height: size.height * 0.09,
                    ),
                  ),
                  const SizedBox(
                    width: k8Padding / 2,
                  ),
                  SizedBox(
                    // height: size.height * 0.09,
                    child: Padding(
                      padding: const EdgeInsets.all(k8Padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Phạm Quốc Khánh',
                            style: TextStyles.defaultStyle.sizeAppbar
                                .colorAppBarText.semiBold,
                          ),
                          const SizedBox(
                            height: k8Padding / 2,
                          ),
                          Text(
                            "7.000.000.000 Point",
                            style: TextStyles
                                .defaultStyle.sizeAppbar.colorAppBarText.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: ColorsApp.hintTextColor,
            height: k8Padding / 2 - 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: k12Padding, right: k12Padding, top: k8Padding),
            child: Column(
              children: [
                Text(
                  'Special products for you',
                  style:
                      TextStyles.defaultStyle.sizeAppbar.colorHeadingText.bold,
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
                  imgGift: HelperAssets.imgThitHeo,
                  nameGift: 'Thịt Heo siêu nạt',
                  priceGift: '10000',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/detail_exchange_gift_screen");
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
