import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/services/api_services.dart';

import 'package:k2dbmoneyapp/views/widgets/widget_item_product_promotion.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_item_promotion.dart';

import '../../../core/model/user_model.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);
  static const routeName = "/promotion_screen";

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;




    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Promotion',
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
      body:

      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 24, 12, 12),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsApp.primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: k8Padding),
                                        child: Text(
                                          'Accumulated points',
                                          style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText.semiBold,
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.453,
                                        height: size.height * 0.06,
                                        decoration: const BoxDecoration(
                                          color: ColorsApp.statusNoteColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(70),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(k8Padding),
                                        child: Text(
                                          "7.000.000.000 Point",
                                          style: TextStyles.defaultStyle.sizeHeading.colorYellowText.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: k12Padding,
                  right: 0,
                  child: HelperImage.loadFromAsset(
                    HelperAssets.iconPromotion,
                    height: size.height*0.1,
                    width: size.height*0.1 + 1,
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
                  onTap: () {
                    Navigator.of(context).pushNamed("/my_gift_screen");
                  },
                ),
                ItemPromotion(
                  nameItem: "EXCHANGE GIFTS",
                  describeItem: "Use points to exchange gifts",
                  icon: FontAwesomeIcons.gift,
                  onTap: () {
                    Navigator.of(context).pushNamed("/exchange_gift_screen");
                  },
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
                        style: TextStyles.defaultStyle.sizeAppbar.colorDeepBlueText.semiBold,
                      ),
                    ]
                  ),
                ),
                // Products section
                Column(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 25,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: k12Padding),
                          child: ItemProductPromotion(
                            imgProduct: HelperAssets.bannerProductPromotion,
                            namePromotion: "Giảm đến 45% cho các thiết bị gia dụng",
                            timePromotion: "13",
                            onTap: () {
                              Navigator.of(context).pushNamed("/detail_gift_screen");
                              // Navigator.of(context).pushNamed("/my_gift_screen");
                            },
                          ),
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