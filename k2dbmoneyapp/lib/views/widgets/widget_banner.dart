import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';

import '../../../core/constant/dimension.dart';

final List<String> bannerList = [
  HelperAssets.banner1,
  HelperAssets.banner2,
  HelperAssets.banner3,
  HelperAssets.banner4,
  HelperAssets.banner5
];

class BannerHome extends StatelessWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      itemCount: bannerList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(kBorderRadiusMin),
        ),
        child: Image.asset(
          bannerList[itemIndex],
          width: size.width,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      options: CarouselOptions(
        aspectRatio: size.height / size.width,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
    );
  }
}
