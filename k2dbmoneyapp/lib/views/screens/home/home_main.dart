import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/home/detail_product_screeen.dart';
import 'package:k2dbmoneyapp/views/screens/home/notfication_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/products_screen.dart';
import 'package:k2dbmoneyapp/views/screens/home/top-up/top_up_screen.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_main.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';
import '../../../core/helpers/helper_asset.dart';
import '../../../core/helpers/helper_image.dart';
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
            const SizedBox(height: k12Padding),
            const BannerHome(),
            const SizedBox(height: k16Padding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
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
                        ),
                      ),
                      const SizedBox(width: k8Padding),
                      Text(
                        isDisplayCurrentBalance
                            ? (21122022.0).toFormatMoney()
                            : "******",
                        style: TextStyles.defaultStyle.bold,
                      ),
                      const Spacer(),
                      IconTextLink(
                        title: "Funds",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: k20Padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardItemFunction(
                        icon: FontAwesomeIcons.circlePlus,
                        text: "Top up",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(TopUpScreen.routeName);
                        },
                      ),
                      CardItemFunction(
                        icon: FontAwesomeIcons.arrowUpFromBracket,
                        text: "Withdraw",
                        onTap: () {},
                      ),
                      CardItemFunction(
                        icon: FontAwesomeIcons.wallet,
                        text: "Payment",
                        onTap: () {},
                      ),
                      CardItemFunction(
                        icon: FontAwesomeIcons.qrcode,
                        text: "Scan QR",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: k24Padding, thickness: k8Padding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Best Selling",
                      style: TextStyles
                          .defaultStyle.sizeAppbar.semiBold.colorDeepBlueText),
                  const SizedBox(
                    height: k8Padding,
                  ),
                ],
              ),
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
                        return Padding(
                          padding: EdgeInsets.only(
                              right: k8Padding,
                              left: index == 0 ? k8Padding : 0),
                          child: const CardItemTopProduct(
                              imagePath: HelperAssets.imageAvt,
                              nameProduct: "Le Han Quoc sieu",
                              price: 0),
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
                      itemCount: 23,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: k8Padding,
                        mainAxisSpacing: k16Padding,
                        childAspectRatio: 4 / 5,
                      ),
                      itemBuilder: (context, index) => CardItemProduct(
                        imgProduct: HelperAssets.product,
                        nameProduct: "Lê Hàn Quốc siêu rẻ, siêu ngon bao ăn",
                        imgStore: HelperAssets.logoBrandStore,
                        nameStore: "Bách Hóa Xanh",
                        price: 100000,
                        quantity: 12500,
                        discountPercent: 20,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(DetailProductScreen.routeName);
                        },
                      ),
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
