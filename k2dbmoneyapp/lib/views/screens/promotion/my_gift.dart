import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';

import '../../../core/helpers/helper_asset.dart';
import '../../../core/helpers/helper_image.dart';
import '../../../core/widgets/widget-text-field-search.dart';
import '../../widgets/widget_item_promotion_program.dart';


class MyGiftScreen extends StatefulWidget {
  const MyGiftScreen({Key? key}) : super(key: key);
  static const routeName = "/my_gift_screen";

  @override
  State<MyGiftScreen> createState() => _MyGiftScreenState();
}

class _MyGiftScreenState extends State<MyGiftScreen> {

  final fieldText = TextEditingController();
  bool _showOption1 = true;
  bool isLiked = false;

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,

        centerTitle: true,
        title: Text('My gift',
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: ColorsApp.primaryColor, // Set the background color here
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: k12Padding,
                vertical: k12Padding,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    TextFieldSearch(
                      fieldText: fieldText,
                      hintText: "Search Store",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.064,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: k12Padding), // set the desired top and bottom padding here
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _showOption1 = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: _showOption1 ? ColorsApp.hintTextColor : ColorsApp.backgroundLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: SizedBox(
                              height: 100,  // set the desired height here
                              child: Padding(
                                padding: const EdgeInsets.all(k8Margin), // set the desired top and bottom padding here
                                child: Text(
                                  'Vouchers are available',
                                  textAlign: TextAlign.center,
                                  style: _showOption1 ? TextStyles.defaultStyle.sizeTitleAndButton.colorAppBarText.semiBold : TextStyles.defaultStyle.sizeTitleAndButton.colorTitleText.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 0),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: k12Padding), // set the desired top and bottom padding here
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showOption1 = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: !_showOption1 ? ColorsApp.hintTextColor : ColorsApp.backgroundLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: SizedBox(// set the desired height here
                                child: Padding(
                                  padding: const EdgeInsets.all(k8Margin), // set the desired top and bottom padding here
                                  child: Text(
                                    'Promotion Program',
                                    textAlign: TextAlign.center,
                                    style: _showOption1 ? TextStyles.defaultStyle.sizeTitleAndButton.colorTitleText.semiBold : TextStyles.defaultStyle.sizeTitleAndButton.colorAppBarText.semiBold,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Visibility(
                        visible: _showOption1,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: k24Padding*3),
                                      HelperImage.loadFromAsset(
                                        HelperAssets.iconBoxMyGift,
                                        height: size.height*0.2,
                                        width: size.width*0.5,
                                      ),
                                      const SizedBox(height: k24Padding*2 + 2),
                                      Text(
                                        'YOU DON`T HAVE NO PROMOTION',
                                        style: TextStyles.defaultStyle.sizeTitleAndButton.colorTitleText.bold,
                                      ),
                                      const SizedBox(height: k12Padding - 2),
                                      Text(
                                        'See more of the latest promotions from K2DBMoney or use accumulated points to redeem attractive gifts',
                                        style: TextStyles.defaultStyle.sizeTitleAndButton.colorTitleText.regular,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: k12Padding - 2),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed("/promotion_screen");
                                              // Do something when button is pressed
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorsApp.primaryColor,// set foreground color
                                            ),
                                            child: Container(
                                              width: size.width*1,
                                              padding: const EdgeInsets.all(k12Padding),
                                              child: Text(
                                                'Discover more',
                                                style: TextStyles.defaultStyle.sizeTitleAndButton.colorAppBarText.bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed("/exchange_gift_screen");
                                              // Do something when button is pressed
                                            },
                                            child: Text(
                                              'Use points exchange gifts',
                                              style: TextStyles.defaultStyle.sizeTitleAndButton.colorDeepBlueText.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !_showOption1,
                          child: SizedBox(
                            height: size.height*1,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 3.2,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemPromotionProgram(
                                  onTap: () {},
                                  onTapShare: () {},
                                  onTapHeart: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  colorHeart: isLiked ? ColorsApp.statusErrorColor : ColorsApp.backgroundDark,
                                  textTitle: 'Thanh toán hóa đơn',
                                  textDescribe: 'Thanh toán hóa đơn - Giảm 50% cho hóa đơn từ 100.000VNĐ tối đa 50.000VNĐ',
                                  textDate: 'HSD: 31/13/2023',
                                );
                              },
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}