import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  static const routeName = "/detail_product_screen";

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => HelperImage.loadFromAsset(
                      HelperAssets.detailProduct,
                    ),
                  ),
                ),
                Positioned(
                    top: k12Padding,
                    left: k12Padding,
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                      onPressed: () {},
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
