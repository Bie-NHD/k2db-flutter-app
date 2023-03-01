import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import 'package:k2dbmoneyapp/views/widgets/widget_item_product_promotion.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_promotion.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);
  static const routeName = "/promotion_screen";

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: Text('Promotion',
            style: TextStyles.defaultStyle.colorDefaultText.colorAppBarText.sizeAppbar.bold
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(k12Padding),
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidCircleQuestion,
              size: kIconSize - 2,
            ),
            tooltip: "Help",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 24, 12, 12),
                  child: Container(
                    width: 366,
                    height: 90,
                    decoration: BoxDecoration(
                      color: ColorsApp.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 210,
                            height: 46,
                            decoration: const BoxDecoration(
                              color: ColorsApp.statusNoteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: k12Padding,
                          left: k12Padding,
                          child: Text(
                            'Accumulated points',
                            style: TextStyles.defaultStyle.colorAppBarText.bold.sizeDefault,
                          ),
                        ),
                        Positioned(
                          bottom: k12Padding,
                          left: k12Padding,
                          child: Text(
                            "7.000.000.000.000.000 Point",
                            style: TextStyles.defaultStyle.colorAppBarText.regular.sizeDefault,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: HelperImage.loadFromAsset(
                              HelperAssets.iconPromotion,
                              height: 60,
                              width: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ItemPromotion(
                  nameItem: "MY GIFT",
                  describeItem: "Promotions are available",
                  icon: Icons.local_offer,
                  onTap: () {},
                ),
                ItemPromotion(
                  nameItem: "EXCHANGE GIFTS",
                  describeItem: "Use points to exchange gifts",
                  icon: FontAwesomeIcons.gift,
                  onTap: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(k12Padding),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Recommend for you',
                        style: TextStyles.defaultStyle.colorDeepBlueText.bold.sizeHeading,
                      ),
                    ]
                  ),
                ),
                // Products section
                Column(
                  children: [
                    SizedBox(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 25,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: k20Padding,
                          mainAxisSpacing: k12Padding,
                          childAspectRatio: 55/34,
                        ),
                        itemBuilder: (context, index) => ItemProductPromotion(
                          imgProduct: HelperAssets.bannerProductPromotion,
                          namePromotion: "Giảm đến 45% cho các thiết bị gia dụng",
                          timePromotion: "Còn 13 ngày nữa hết hạn",
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}