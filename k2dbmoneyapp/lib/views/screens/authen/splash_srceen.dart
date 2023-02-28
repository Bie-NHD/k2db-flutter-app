// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../../../../core/helpers/helper_asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    return Navigator.of(context).pushNamed("/onBoarding_screen");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: HelperImage.loadFromAsset(
                HelperAssets.topLeftSplash,
                height: size.height * 0.08,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            top: 150,
            left: animate ? k24Padding : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "K2DB Money",
                    style: TextStyles
                        .defaultStyle.bold.sizeHeading.colorYellowText,
                  ),
                  Text("Automatic Payment",
                      style: TextStyles
                          .defaultStyle.colorHeadingText.sizeTitleAndButton),
                  Text("Transaction Optimization",
                      style: TextStyles
                          .defaultStyle.colorHeadingText.sizeTitleAndButton)
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 250 : 0,
            left: k24Padding,
            right: k24Padding,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: HelperImage.loadFromAsset(HelperAssets.imageSplash,
                  width: size.width * 0.8),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            bottom: animate ? 0 : -30,
            right: animate ? 0 : -30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: HelperImage.loadFromAsset(
                HelperAssets.bottomRightSplash,
                height: size.height * 0.08,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
