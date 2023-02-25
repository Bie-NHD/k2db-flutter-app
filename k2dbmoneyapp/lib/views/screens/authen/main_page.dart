import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/store/store_main.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
import '../home/home_main.dart';
import '../promotion/promotion_main.dart';
import '../statistic/statistic_main.dart';
import '../user/user_main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = "/main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.backgroundLight,
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              // Home
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kIconSize,
                ),
                title: Text("Home",
                    style: TextStyles.defaultStyle.colorDeepBlueText.semiBold),
                selectedColor: ColorsApp.primaryColor,
                unselectedColor: ColorsApp.tertiaryColors,
              ),
              // Promotion
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.gift,
                  size: kIconSize,
                ),
                title: Text("Promotion",
                    style: TextStyles.defaultStyle.colorDeepBlueText.semiBold),
                selectedColor: ColorsApp.primaryColor,
                unselectedColor: ColorsApp.tertiaryColors,
              ),
              // Store
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.store,
                  size: kIconSize,
                ),
                title: Text("Store",
                    style: TextStyles.defaultStyle.colorDeepBlueText.semiBold),
                selectedColor: ColorsApp.primaryColor,
                unselectedColor: ColorsApp.tertiaryColors,
              ),
              // Statistic
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.chartSimple,
                  size: kIconSize,
                ),
                title: Text("Statistic",
                    style: TextStyles.defaultStyle.colorDeepBlueText.semiBold),
                selectedColor: ColorsApp.primaryColor,
                unselectedColor: ColorsApp.tertiaryColors,
              ),
              // User
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.userLarge,
                  size: kIconSize,
                ),
                title: Text("User",
                    style: TextStyles.defaultStyle.colorDeepBlueText.semiBold),
                selectedColor: ColorsApp.primaryColor,
                unselectedColor: ColorsApp.tertiaryColors,
              ),
            ]),
        body: IndexedStack(index: _currentIndex, children: [
          const HomeScreen(),
          const PromotionScreen(),
          const StoreScreen(),
          const Statistic(),
          UserScreen(),
        ]));
  }
}
