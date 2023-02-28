import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

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
          ],
        ),
      ),
    );
  }
}