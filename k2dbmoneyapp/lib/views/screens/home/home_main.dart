import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/icon_textlink.dart';
import '../../../../core/constant/text.dart';
import '../../widgets/widget_banner.dart';
import '../../widgets/widget_card_function.dart';
import 'Widgets/widget_card_itemproduct.dart';
import 'Widgets/widget_card_itemtopproduct.dart';

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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        leadingWidth: k20Padding * 2.7,
        leading: Padding(
          padding: const EdgeInsets.only(left: k12Padding),
          child: CircleAvatar(
            child: HelperImage.loadFromAsset(HelperAssets.imageAvt,
                radius: BorderRadius.circular(k24Padding * 2)),
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  const SizedBox(height: k12Padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardItemFunction(
                        icon: FontAwesomeIcons.circlePlus,
                        text: "Top up",
                        onTap: () {},
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
                  Text("For you",
                      style: TextStyles
                          .defaultStyle.fontAppbar.semiBold.colorPrimaryText),
                  const SizedBox(
                    height: k8Padding,
                  ),
                ],
              ),
            ),
            // For you list
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 140,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: k8Padding,
                          ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const CardItemTopProduct(
                            imagePath: HelperAssets.imageAvt,
                            nameProduct: "Le Han Quoc sieu",
                            price: 123456);
                      }),
                )),
              ],
            ),
            const Divider(height: k24Padding, thickness: k8Padding / 2),
            // Products section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Row(
                    children: [
                      Text(
                        "Products",
                        style: TextStyles
                            .defaultStyle.fontAppbar.semiBold.colorPrimaryText,
                      ),
                      const Spacer(),
                      IconTextLink(
                        title: "See all",
                        onTap: () {},
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: k12Padding,
                  // ),
                  const SizedBox(
                    height: k8Padding,
                  ),
                  SizedBox(
                    height: size.height,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: k8Padding,
                        mainAxisSpacing: k24Padding,
                      ),
                      itemBuilder: (context, index) => CardItemProduct(
                        onTap: () {},
                        imagePath: HelperAssets.imageAvt,
                        nameProduct: "Hoang Gia Kiet dep trai qua hihi",
                        price: 10000,
                        discountPercent: 20,
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
