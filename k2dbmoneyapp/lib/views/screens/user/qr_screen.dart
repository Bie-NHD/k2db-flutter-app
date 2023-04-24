import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text.dart';

class QRScreen extends StatefulWidget {
  static const String routeName = '/qr_screen';

  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = [
    const Tab(
      text: "Scan",
    ),
    const Tab(
      text: "User QR",
    )
  ];

  late TabController _tabController;
  int _currentIndex = 0;
  bool _flash = true;
  List<int> loadedPages = [
    0,
  ];

  late List<Widget> screens = [
    Container(color: Colors.red, child: const Text("Tab Content here")),
    loadedPages.contains(1) ? const Text("Second tab") : Container(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: k24Padding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                      )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _flash = !_flash;
                      });
                    },
                    icon: Icon(!_flash
                        ? FontAwesomeIcons.solidLightbulb
                        : FontAwesomeIcons.lightbulb),
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: Container(
                  // height: size.width*0.8,
                  // width: double.maxFinite,
                  color: ColorsApp.statusNoteColor,
                  child: Center(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: screens,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TabBar(
                controller: _tabController,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: k12Padding),
                labelColor: Colors.white,
                unselectedLabelColor: ColorsApp.backgroundLight,
                labelStyle: TextStyles.defaultStyle.semiBold.colorDefaultText,
                indicator: BoxDecoration(
                    color: ColorsApp.statusNoteColor,
                    borderRadius: BorderRadius.circular(kBorderRadiusMin)),
                tabs: tabs,
                onTap: (index) {
                  _tabController.animateTo(index);
                  setState(() {
                    if (!loadedPages.contains(index)) {
                      loadedPages.add(index);
                    }
                    _currentIndex = index;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
