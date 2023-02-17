import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/constant/dimension.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

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
              title: const Text("Home"),
              selectedColor: ColorsApp.primaryColor,
              unselectedColor: ColorsApp.tertiaryColors,
            ),
            // Promotion
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.gift,
                size: kIconSize,
              ),
              title: const Text("Promotion"),
              selectedColor: ColorsApp.primaryColor,
              unselectedColor: ColorsApp.tertiaryColors,
            ),
            // Store
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.store,
                size: kIconSize,
              ),
              title: const Text("Store"),
              selectedColor: ColorsApp.primaryColor,
              unselectedColor: ColorsApp.tertiaryColors,
            ),
            // Statistic
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.chartSimple,
                size: kIconSize,
              ),
              title: const Text("Statistic"),
              selectedColor: ColorsApp.primaryColor,
              unselectedColor: ColorsApp.tertiaryColors,
            ),
            // User
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.userLarge,
                size: kIconSize,
              ),
              title: const Text("User"),
              selectedColor: ColorsApp.primaryColor,
              unselectedColor: ColorsApp.tertiaryColors,
            ),
          ]),
      body: IndexedStack(
        index: _currentIndex,
        children: [],
      ),
    );
  }
}
