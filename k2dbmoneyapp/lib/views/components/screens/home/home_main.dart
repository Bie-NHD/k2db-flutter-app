import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_string.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/icon_textlink.dart';
import 'package:k2dbmoneyapp/views/components/screens/home/Widgets/widget_card_itemforyou.dart';
import 'package:k2dbmoneyapp/views/components/widgets/widget_banner.dart';
import 'package:k2dbmoneyapp/views/components/widgets/widget_card_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerHome(),
            const SizedBox(height: k12Padding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidEye,
                        size: kIconSize * 0.7,
                      ),
                      const SizedBox(width: k8Padding),
                      Text(
                        "23.291.0000",
                        style: TextStyles.defaultStyle.bold,
                      ),
                      const Spacer(),
                      const IconTextLink(title: "Funds"),
                    ],
                  ),
                  const SizedBox(height: k24Padding),
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
            const Divider(height: k20Padding * 2, thickness: k8Padding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("For you",
                      style:
                          TextStyles.defaultStyle.fontAppbar.colorSecondText),
                  const SizedBox(height: k8Padding),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const CardItemForYou(
                            imagePath: HelperAssets.imageAvt,
                            nameProduct: "Lê Hàn Quốc siêu",
                            price: "95.000đ",
                          ),
                      separatorBuilder: (context, index) => const Divider(
                            height: k12Padding,
                          ),
                      itemCount: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
