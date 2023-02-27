import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_card_function.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Center(
          child: Text('Transaction History',
              style: TextStyles.defaultStyle.colorDefaultText.colorAppBarText
                  .sizeAppbar.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.chartSimple,
              size: kIconSize,
              // color: ColorsApp.primaryColor,
            ),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorsApp.backgroundLight,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height * 0.4,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: size.height * 0.2,
                  decoration: const BoxDecoration(
                      color: ColorsApp.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 24,
                    height: 210,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      // height: 150,
                      decoration: BoxDecoration(
                          color: ColorsApp.backgroundDark.withOpacity(0.99),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: k20Padding * 1.5,
                                width: k20Padding * 1.5,
                                margin: const EdgeInsets.only(
                                  top: k20Padding,
                                  left: k24Padding,
                                  // bottom: k12Margin,
                                  right: k14Padding,
                                ),
                                child: HelperImage.loadFromAsset(
                                  HelperAssets.imageAvt,
                                  radius: BorderRadius.circular(
                                      kBorderRadiusMax * 2),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: k20Padding),
                                child: Text(
                                  'K2DP Money',
                                  style: TextStyles
                                      .defaultStyle
                                      .sizeTitleAndButton
                                      .colorAppBarText
                                      .semiBold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: k24Padding),
                            child: Row(
                              children: [
                                Text(
                                  '23.239.000 đ',
                                  style: TextStyles.defaultStyle.colorRedText
                                      .sizeHeading.bold,
                                ),
                                const Spacer(),
                                Container(
                                  height: k20Padding * 1.8,
                                  width: k20Padding * 1.8,
                                  margin: const EdgeInsets.only(
                                      right: 24,
                                      top: k12Margin,
                                      bottom: k12Margin),
                                  child: HelperImage.loadFromAsset(
                                    HelperAssets.imageAvt,
                                    radius: BorderRadius.circular(
                                        kBorderRadiusMax * 2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: k24Padding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Account",
                                  style: TextStyles.defaultStyle.colorAppBarText
                                      .sizeDefault.regular,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: k12Margin,
                                ),
                                Text(
                                  "HOANG GIA KIET",
                                  style: TextStyles.defaultStyle
                                      .sizeTitleAndButton.colorAppBarText.bold,
                                ),
                                Text(
                                  "0321 964 789",
                                  style: TextStyles.defaultStyle
                                      .sizeTitleAndButton.colorAppBarText.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 52, left: k12Padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Transaction History',
                        style: TextStyles.defaultStyle.colorTitleText
                            .sizeTitleAndButton.bold,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: kIconSize - 2,
                          )),
                    ],
                  ),
                  const Divider(
                    height: 0,
                    thickness: k8Padding / 4,
                    indent: 0,
                    endIndent: k12Padding,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: k8Margin,
                          ),
                          child: Row(
                            children: [
                              // icon: FontAwesomeIcons.
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "15/02/2023 20:26:30",
                                    style: TextStyles
                                        .defaultStyle
                                        .sizeTitleAndButton
                                        .colorHintText
                                        .regular,
                                  ),
                                  Text(
                                    "Vo Che Bang chuyen tien nhau",
                                    style: TextStyles.defaultStyle.regular
                                        .sizeTitleAndButton.regular,
                                  )
                                ],
                              ),
                              Text(
                                "-526.000 đ",
                                style: TextStyles.defaultStyle.bold
                                    .sizeTitleAndButton.colorRedText,
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: FontAwesomeIcons.arrowRight
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
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
