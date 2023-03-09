import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/widgets/icon_textlink.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/widgets/dot_indicators.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_onboardContent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const routeName = "/onBoarding_screen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _pageIndex = 0;

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: k12Padding, vertical: k24Padding),
        child: Column(
          children: [
            const SizedBox(height: k24Padding + 10),
            Align(
              alignment: Alignment.topRight,
              child: IconTextLink(
                title: 'Skip',
                onTap: () {
                  Navigator.of(context).pushNamed("/sign_in_screen");
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: onboard.length,
                itemBuilder: (context, index) => OnboardContent(
                  imgOnboard: onboard[index].imgOnboard,
                  titleOnboard: onboard[index].titleOnboard,
                  descOnboard: onboard[index].descOnboard,
                ),
              ),
            ),
            const SizedBox(
              height: k24Padding,
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _pageIndex == onboard.length - 1
                      ? ButtonFill(
                          text: "Get Started",
                          onTap: () {
                            return Navigator.of(context)
                                .pushNamed("/sign_in_screen");
                          })
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  onboard.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(
                                        right: k8Padding / 2),
                                    child: DotIndicator(
                                      isActive: index == _pageIndex,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: k24Padding,
            ),
          ],
        ),
      ),
    );
  }
}
