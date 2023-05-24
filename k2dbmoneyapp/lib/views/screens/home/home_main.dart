import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/help_random.dart';
import 'package:k2dbmoneyapp/views/screens/home/detail_product_screeen.dart';
import 'package:k2dbmoneyapp/views/screens/home/notfication_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/products_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/top-up/top_up_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/transfer_screen.dart';
import 'package:k2dbmoneyapp/views/screens/user/qr_screen.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_main.dart';
import 'package:k2dbmoneyapp/core/model/user.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import '../../../core/helpers/helper_asset.dart';
import '../../../core/helpers/helper_image.dart';
import '../../../core/helpers/demo_data.dart';
import '../../../core/widgets/icon_textlink.dart';
import '../../../core/widgets/widget_card_itemproduct.dart';
import '../../widgets/widget_banner.dart';
import '../../widgets/widget_card_function.dart';
import '../../widgets/widget_card_itemtopproduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDisplayCurrentBalance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(k12Padding),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UserScreen.routeName);
            },
            child: CircleAvatar(
              child: HelperImage.loadFromAsset(
                HelperAssets.imageAvt,
                radius: BorderRadius.circular(kBorderRadiusMax * 2),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyles.defaultStyle.colorAppBarText,
            ),
            Text(
              "Hoang Gia Kiet",
              style: TextStyles.defaultStyle.colorAppBarText.semiBold,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            },
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              size: kIconSize - 2,
            ),
            tooltip: "Notifications",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerHome(),
            Container(
              color: ColorsApp.primaryColor,
              padding: const EdgeInsets.all(k12Padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDisplayCurrentBalance = !isDisplayCurrentBalance;
                          });
                        },
                        child: Icon(
                          isDisplayCurrentBalance
                              ? FontAwesomeIcons.solidEye
                              : FontAwesomeIcons.solidEyeSlash,
                          size: kIconSize * 0.7,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: k8Padding),
                      Text(
                        isDisplayCurrentBalance
                            ? (21122022.0).toFormatMoney()
                            : "******",
                        style: TextStyles.defaultStyle.bold.sizeTitleAndButton
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      IconTextLink(
                        title: "Funds",
                        color: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: k20Padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardItemFunction(
                        icon: FontAwesomeIcons.arrowDownUpAcrossLine,
                        text: "Top up /\nWithdraw",
                        color: Colors.white,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(TopUpScreen.routeName);
                        },
                      ),
                      CardItemFunction(
                        icon: FontAwesomeIcons.moneyBillTransfer,
                        text: "Send Credits",
                        color: Colors.white,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransferScreen(user: User.base)));
                        },
                      ),
                      // CardItemFunction(
                      //   icon: FontAwesomeIcons.paperPlane,
                      //   text: "Send Credits",
                      //   onTap: () {},
                      // ),
                      CardItemFunction(
                        icon: FontAwesomeIcons.qrcode,
                        color: Colors.white,
                        text: "Scan QR",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QRScreen(user: User.base)));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(k12Padding),
              child: Text("Best Selling",
                  style: TextStyles
                      .defaultStyle.sizeAppbar.semiBold.colorDeepBlueText),
            ),
            // Best selling list
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        int i = index;
                        return Padding(
                          padding: EdgeInsets.only(
                              right: k8Padding,
                              left: index == 0 ? k8Padding : 0),
                          child: const CardItemTopProduct(
                              imagePath: HelperAssets.imgLeHanQuoc,
                              nameProduct: "Le Han Quoc sieu ngot",
                              price: 50000),
                        );
                      }),
                )),
              ],
            ),
            const Divider(height: k24Padding, thickness: k8Padding / 2),
            // Products section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "For you",
                        style: TextStyles
                            .defaultStyle.sizeAppbar.semiBold.colorDeepBlueText,
                      ),
                      IconTextLink(
                        title: "See all",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductsScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: k8Padding,
                  ),
                  SizedBox(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: HelperRNG.randIntBetween(10, 50),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: k8Padding,
                        mainAxisSpacing: k16Padding,
                        childAspectRatio: 3.5 / 5,
                      ),
                      itemBuilder: (context, index) {
                        final MapEntry store = DemoData.demoStore.entries
                            .elementAt(
                                HelperRNG.randInt(DemoData.demoStore.length));
                        final MapEntry product = DemoData.demoProduct.entries
                            .elementAt(
                            HelperRNG.randInt(DemoData.demoProduct.length));
                        return CardItemProduct(
                          imgProduct: product.value,
                          nameProduct: product.key,
                          imgStore: store.value,
                          nameStore: store.key,
                          price: HelperRNG.randIntBetween(15, 200) * 1000,
                          quantity: HelperRNG.randInt(50),
                          discountPercent: 10 + HelperRNG.randDouble(40),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(DetailProductScreen.routeName);
                          },
                        );
                      },
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
