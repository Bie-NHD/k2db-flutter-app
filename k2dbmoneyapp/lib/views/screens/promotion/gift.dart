import 'package:flutter/material.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import '../../../core/helpers/helper_asset.dart';

class DetailGiftScreen extends StatefulWidget {
  const DetailGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/detail_gift_screen";

  @override
  State<DetailGiftScreen> createState() => _DetailGiftScreenState();
}

class _DetailGiftScreenState extends State<DetailGiftScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              HelperAssets.bannerProductPromotion,
              width: double.maxFinite,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            // Add more widgets here
          ],
        ),
      ),
    );
  }
}