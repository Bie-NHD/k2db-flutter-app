import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../core/constant/text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const routeName = '/notification_screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> tabs = ["Notifications", "Promotions"];
  int _selectedIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          //   Container(
          //     decoration: const BoxDecoration(color: ColorsApp.primaryColor),
          //     child: PageView(
          //       controller: pageController,
          //       physics: const ClampingScrollPhysics(),
          //     ),
          //   )
          // ],
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: ColorsApp.backgroundLight,
                pinned: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(FontAwesomeIcons.arrowLeft,
                      color: Colors.black),
                ),
                title: Text(
                  "Notification",
                  style: TextStyles.defaultStyle.sizeHeading.bold,
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.arrowLeft,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.arrowLeft,
                          color: Colors.black)),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(height * 0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: k12Padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: tabs
                          .map((String name) => GestureDetector(
                                onTap: () {
                                  // pageController.jumpToPage(tabs.indexOf(name));
                                  setState(() {
                                    _selectedIndex = tabs.indexOf(name);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(k12Padding),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: k8Margin),
                                  decoration:
                                      (tabs.indexOf(name) == _selectedIndex)
                                          ? selectedTabDecoration
                                          : null,
                                  child: Text(name,
                                      style: TextStyles.defaultStyle
                                          .sizeTitleAndButton.semiBold
                                          .copyWith(
                                              color: (tabs.indexOf(name) ==
                                                      _selectedIndex)
                                                  ? ColorsApp.appBarTextColor
                                                  : null)),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Placeholder(),
        ),
      ),
    );
  }

  static const BoxDecoration selectedTabDecoration = BoxDecoration(
    color: ColorsApp.primaryColor,
    borderRadius: BorderRadius.all(Radius.circular(kBorderRadiusMin)),
  );
// const BorderRadius borderRadius = BorderRadius.circular(kBorderRadiusMin);
}
