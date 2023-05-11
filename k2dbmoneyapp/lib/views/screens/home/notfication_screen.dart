import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/HelperData.dart';

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
          body: Container(
            color: ColorsApp.primaryColor,
            child: PageView(
              controller: pageController,
              children: [
                ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.all(k12Padding),
                    itemBuilder: (context, index) => _NotficationTile())
              ],
            ),
          ),
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

class _CustomTile extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final String? text;

  const _CustomTile({Key? key, this.icon, this.title, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(k12Padding),
      decoration: BoxDecoration(
          color: ColorsApp.backgroundLight,
          borderRadius: BorderRadius.circular(kBorderRadiusMax)),
      child: Row(
        children: [
          icon!,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(title!), Text(text!)],
          )
        ],
      ),
    );
  }
}

class _NotficationTile extends _CustomTile {
  final String title = "Cumulative points updated!";
  final int amount = HelperDataGeneration.nextInt(1000);

  _NotficationTile({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return _CustomTile(
      icon: const Icon(
        FontAwesomeIcons.star,
        color: ColorsApp.secondaryColor,
      ),
      title: title,
      text:
          "You received ${HelperDataGeneration.nextInt(1000)} pts from order ${HelperDataGeneration.getRandomString()}",
    );
  }
}
