import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_string.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/icon_textlink.dart';
import 'package:k2dbmoneyapp/views/components/widgets/widget_banner.dart';

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
          children: [
            const BannerHome(),
            const SizedBox(height: k12Padding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: Row(
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
                  const IconTextLink(title: "Funds")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
