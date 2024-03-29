import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/home/transfer_screen.dart';
import 'package:k2dbmoneyapp/views/screens/others/camera_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text.dart';
import '../../../core/helpers/helper_image.dart';
import '../../../core/model/user.dart';

class QRScreen extends StatefulWidget {
  static const String routeName = '/qr_screen';
  final User user;

  const QRScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  late User user = widget.user;
  final PageController _pageController = PageController();
  final List<String> _titles = ["Payment QR", "Scan QR"];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      resizeToAvoidBottomInset: true,
      appBar: (_currentIndex != 2)
          ? AppBar(
              backgroundColor: ColorsApp.primaryColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                _titles[_currentIndex],
                style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText,
              ),
            )
          : null,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabChange,
        selectedItemColor: ColorsApp.primaryColor,
        unselectedItemColor: ColorsApp.secondaryColor,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.qrcode,
              size: kIconSize,
            ),
            title: Text(
              "Payment QR",
              style: TextStyles.defaultStyle.bold.colorDeepBlueText,
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.camera,
              size: kIconSize,
            ),
            title: Text(
              "Scan",
              style: TextStyles.defaultStyle.bold.colorDeepBlueText,
            ),
          ),
          // SalomonBottomBarItem(
          //   icon: const Icon(
          //     FontAwesomeIcons.paperPlane,
          //     size: kIconSize,
          //   ),
          //   title: Text(
          //     "Transfer",
          //     style: TextStyles.defaultStyle.bold.colorDeepBlueText,
          //   ),
          // ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          UserPaymentQR(user: user),
          CameraScreen(),
          // TransferScreen(
          //   user: user,
          // ),
        ],
      ),
    );
  }

  void _onTabChange(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}

class UserPaymentQR extends StatelessWidget {
  const UserPaymentQR({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            // height: height * 0.7,
            margin: const EdgeInsets.symmetric(vertical: k24Padding),
            padding: const EdgeInsets.all(k24Padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kBorderRadiusMin),
            ),
            child: Column(
              children: [
                Center(
                  child: HelperImage.loadFromAsset(user.userAvatar,
                      height: MediaQuery.of(context).size.height * 0.1),
                ),
                Text(
                  user.userName!.toUpperCase(),
                  style: TextStyles.defaultStyle.sizeHeading.semiBold,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: k12Margin),
                    padding: const EdgeInsets.all(k12Padding),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: ColorsApp.backgroundLight,
                      border:
                          Border.all(color: ColorsApp.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(kBorderRadiusMax),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsApp.tertiaryColors.withOpacity(.8),
                          offset: const Offset(5, 10),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: QrImageView(
                      data: user.phoneNum,
                      padding: const EdgeInsets.all(k24Padding),
                      // foregroundColor: ColorsApp.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () {
                  //TODO Render Image
                },
                icon: const Icon(
                  FontAwesomeIcons.download,
                  color: ColorsApp.primaryColor,
                ),
                label: Text(
                  "Download",
                  style: TextStyles.defaultStyle.colorDeepBlueText,
                )),
            TextButton.icon(
                onPressed: () {
                  //TODO System share
                },
                icon: const Icon(
                  FontAwesomeIcons.share,
                  color: ColorsApp.primaryColor,
                ),
                label: Text(
                  "Share",
                  style: TextStyles.defaultStyle.colorDeepBlueText,
                ))
          ],
        )
      ],
    );
  }
}
