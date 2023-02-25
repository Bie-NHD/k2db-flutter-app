import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/screens/user/Widgets/user_navigator.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';

class UserScreen extends StatelessWidget {
  static const routeName = "/user_screen";
  String userID = "0123456789";
  String userBalance = "123.600";
  String currencySym = "₫";
  bool isShowingBalance = false;

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              size: kIconSize - 2,
            ),
            tooltip: "Notifications",
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(k24Padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 24,
              padding: const EdgeInsets.all(k14Padding),
              decoration: BoxDecoration(
                  color: ColorsApp.backgroundLight.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(kBorderRadiusMax),
                  boxShadow: [
                    BoxShadow(
                        color: ColorsApp.tertiaryColors.withOpacity(0.3),
                        offset: const Offset(5, 4),
                        blurRadius: 20,
                        spreadRadius: 3)
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: kIconSize * 1.5,
                    child: HelperImage.loadFromAsset(HelperAssets.imageAvt,
                        radius: BorderRadius.circular(kBorderRadiusIcon)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Hoang Gia Kiet".toUpperCase(),
                          style: TextStyle(
                              fontSize:
                                  TextStyles.defaultStyle.sizeHeading.fontSize,
                              fontWeight:
                                  TextStyles.defaultStyle.semiBold.fontWeight)),
                      Container(
                          margin:
                              const EdgeInsets.symmetric(vertical: k8Margin),
                          child: GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: userID));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  userID,
                                  style: TextStyles.defaultStyle.colorHintText,
                                ),
                                const SizedBox(width: k8Padding),
                                const Icon(
                                  FontAwesomeIcons.copy,
                                  size: kIconSize * 0.8,
                                  color: ColorsApp.secondaryColor,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      FontAwesomeIcons.angleRight,
                      size: kIconSize,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 24,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: const EdgeInsets.only(top: k12Margin),
              padding: const EdgeInsets.all(k14Padding),
              decoration: BoxDecoration(
                  color: ColorsApp.tertiaryColors,
                  borderRadius: BorderRadius.circular(kBorderRadiusMax)),
            ),
            UserNavigator(
                userBalance: userBalance,
                currencySym: currencySym,
                isShowingBalance: isShowingBalance)
          ],
        ),
      ),
    );
  }
}
