import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/help_random.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';

import '../../../core/constant/text.dart';
import '../../../core/helpers/helper_asset.dart';

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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
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
                                  pageController.jumpToPage(tabs.indexOf(name));
                                  setState(() {
                                    _selectedIndex = tabs.indexOf(name);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.decelerate,
                                  padding: const EdgeInsets.all(k12Padding),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: k8Margin),
                                  decoration:
                                      (tabs.indexOf(name) == _selectedIndex)
                                          ? selectedTabDecoration
                                          : const BoxDecoration(),
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
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(k12Padding),
                    itemBuilder: (context, index) => const _NotificationTile()),
                ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(k12Padding),
                    itemBuilder: (context, index) => const _PromotionTile()),
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
}

class _CustomTile extends StatelessWidget {
  final Icon? icon;
  final String? _title;
  final Widget? content;
  final String? imageFilePath;
  final String? logoFilePath;

  const _CustomTile(
      {Key? key,
      this.icon,
      String? title,
      this.content,
      this.imageFilePath,
      this.logoFilePath})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: k8Margin),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: ColorsApp.backgroundLight,
          borderRadius: BorderRadius.circular(kBorderRadiusMax)),
      child: Column(
        children: [
          (imageFilePath != null)
              ? HelperImage.loadFromAsset(imageFilePath!)
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(k12Padding),
            child: Row(
              children: [
                (logoFilePath == null)
                    ? icon!
                    : HelperImage.loadFromAsset(logoFilePath!,
                        height: kIconSize,
                        radius: const BorderRadius.all(
                            Radius.circular(kBorderRadiusIcon))),
                const SizedBox(
                  width: k8Padding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _title ?? "",
                      style: TextStyles.defaultStyle.sizeTitleAndButton.bold
                          .colorDeepBlueText,
                    ),
                    content ?? const SizedBox.shrink()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationTile extends _CustomTile {
  const _NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomTile(
        icon: const Icon(
          FontAwesomeIcons.star,
          color: ColorsApp.secondaryColor,
        ),
        title: "Cumulative points updated!",
        content: RichText(
          text: TextSpan(
              text: "You received ",
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: "${HelperRNG.nextInt(1000)} pts ",
                    style: TextStyles.defaultStyle.bold.colorDeepBlueText),
                TextSpan(text: "from order ${HelperRNG.getRandomString()}")
              ]),
        ));
  }
}

class _PromotionTile extends _CustomTile {
  const _PromotionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomTile(
      title: "Discount ${HelperRNG.nextInt(100)}% for all housewares",
      imageFilePath: HelperAssets.bannerProductPromotion,
      logoFilePath: HelperAssets.logoBrandStore,
    );
  }
}
