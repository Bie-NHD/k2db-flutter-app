import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/views/screens/statistic/Transaction_search.dart';
import '../../widgets/widget_item_history.dart';
import 'statistical_chart_screen.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorsApp.backgroundLight,
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   backgroundColor: ColorsApp.primaryColor,
        //   // title: Text(
        //   //   "Transaction History",
        //   //   style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
        //   // ),
        //   // actions: [
        //   //   // IconButton(
        //   //   //   padding: const EdgeInsets.all(k12Padding),
        //   //   //   onPressed: () {
        //   //   //     Navigator.push(context,
        //   //   //         MaterialPageRoute(builder: (context) => Statistical_Chart()));
        //   //   //   },
        //   //   //   icon: const Icon(
        //   //   //     FontAwesomeIcons.chartSimple,
        //   //   //     size: kIconSize - 2,
        //   //   //   ),
        //   //   //   tooltip: "...",
        //   //   // )
        //   // ],
        // ),
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      color: ColorsApp.primaryColor,
                      padding: const EdgeInsets.all(k12Padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transaction History",
                            style: TextStyles.defaultStyle.bold.colorAppBarText
                                .sizeTitleAndButton,
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(k12Padding),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Statistical_Chart()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.chartSimple,
                              size: kIconSize,
                              color: Colors.white,
                            ),
                            tooltip: "...",
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        CustomPaint(
                          painter: _SemiCircle(),
                          size: Size(size.width, size.height * 0.3),
                        ),

                        // Container(
                        //     width: double.maxFinite,
                        //     height: size.height * 0.2,
                        //     decoration: const BoxDecoration(
                        //         color: ColorsApp.primaryColor,
                        //         // shape: BoxShape.circle,
                        //         borderRadius: BorderRadius.only(
                        //             bottomLeft: Radius.circular(90),
                        //             bottomRight: Radius.circular(90)))),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: k24Padding,
                          height: size.height * 0.22,
                          child: _UserCard(),
                        )
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          // child: Column(
          //   children: [

          // Expanded(
          //   // child: Container(
          //   //   padding: const EdgeInsets.symmetric(horizontal: k12Padding),
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //         child:
          //         Row(
          //           children: [
          //             Text(
          //               'Transaction History',
          //               style: TextStyles.defaultStyle.colorTitleText
          //                   .sizeTitleAndButton.bold,
          //             ),
          //             const Spacer(),
          //             IconButton(
          //                 onPressed: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) =>
          //                               Transaction_search()));
          //                 },
          //                 icon: const Icon(
          //                   FontAwesomeIcons.magnifyingGlass,
          //                   size: kIconSize - 2,
          //                 )),
          //           ],
          //         ),
          //       ),

          // ],
          // ),
          // ),
        )
        // ],
        // ),
        // ),
        );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: k12Margin * 2.5),
      surfaceTintColor: ColorsApp.backgroundLight,
      color: ColorsApp.hintTextColor,
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: k8Margin, horizontal: k12Margin * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: k20Padding * 2,
                  width: k20Padding * 2,
                  // padding: const EdgeInsets.only(left: k12Padding),
                  child: HelperImage.loadFromAsset(
                    HelperAssets.imageAvt,
                    radius: BorderRadius.circular(kBorderRadiusMax * 2),
                  ),
                ),
                const SizedBox(
                  width: k12Padding,
                ),
                Text(
                  'K2DB Money',
                  style: TextStyles
                      .defaultStyle.sizeTitleAndButton.colorAppBarText.semiBold,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '23.239.000 đ',
                  style: TextStyles
                      .defaultStyle.colorDeepBlueText.sizeHeading.bold,
                ),
                const Spacer(),
                Container(
                  height: k20Padding * 1.8,
                  width: k20Padding * 1.8,
                  margin:
                      const EdgeInsets.only(top: k12Margin, bottom: k12Margin),
                  child: HelperImage.loadFromAsset(
                    HelperAssets.imageAvt,
                    radius: BorderRadius.circular(kBorderRadiusMax * 2),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Account",
                  style: TextStyles
                      .defaultStyle.colorAppBarText.sizeDefault.regular,
                ),
                const SizedBox(
                  height: k12Margin / 2,
                ),
                Text(
                  "HOANG GIA KIET",
                  style: TextStyles
                      .defaultStyle.sizeTitleAndButton.colorAppBarText.semiBold,
                ),
                Text(
                  "**** *** 789",
                  style: TextStyles
                      .defaultStyle.sizeTitleAndButton.colorAppBarText.semiBold,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SemiCircle extends CustomPainter {
  _SemiCircle() : super();
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorsApp.primaryColor;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, Size.zero.height),
            width: size.width,
            height: size.height),
        math.pi,
        -math.pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
