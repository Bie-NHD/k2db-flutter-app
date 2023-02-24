import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/widgets/dot_indicators.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_onboardContent.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboard.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: k8Padding / 2),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: k24Padding * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
              child: ButtonFill(
                  text: "Get Started",
                  onTap: () {
                    return Navigator.of(context).pushNamed("/main_page");
                  }),
            ),
            const SizedBox(
              height: k24Padding * 2,
            )
          ],
        ),
      ),
    );
  }
}
