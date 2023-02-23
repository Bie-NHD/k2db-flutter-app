import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_string.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';

class UserScreen extends StatelessWidget {
  static const routeName = "/user_screen";

  const UserScreen({super.key});

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
                    radius: kIconSize * 2,
                    child: HelperImage.loadFromAsset(HelperAssets.imageAvt,
                        radius: BorderRadius.circular(kBorderRadiusIcon)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Hoang Gia Kiet".toUpperCase(),
                          style: TextStyle(
                              fontSize: TextStyles
                                  .defaultStyle.fontTitleAndButton.fontSize,
                              fontWeight:
                                  TextStyles.defaultStyle.semiBold.fontWeight)),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: k8Margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "123456789",
                              style: TextStyles.defaultStyle.colorHintText,
                            ),
                            const Icon(
                              FontAwesomeIcons.copy,
                              size: kIconSize * 0.8,
                              color: ColorsApp.secondaryColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    FontAwesomeIcons.angleRight,
                    size: kIconSize,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
