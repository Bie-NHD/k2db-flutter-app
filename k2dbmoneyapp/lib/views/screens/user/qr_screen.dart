import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/screens/home/transfer_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text.dart';
import 'Modal/User.dart';
import 'Widgets/widget_qr_scan_tab.dart';
import 'Widgets/widget_qr_view_tab.dart';

class QRScreen extends StatefulWidget {
  static const String routeName = '/qr_screen';
  User user;

  QRScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen>
    with SingleTickerProviderStateMixin {
  late User user = widget.user;
  QRViewController? qrViewController;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      resizeToAvoidBottomInset: true,
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
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.arrowUpFromBracket,
              size: kIconSize,
            ),
            title: Text(
              "Transfer",
              style: TextStyles.defaultStyle.bold.colorDeepBlueText,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          UserPaymentQR(user: user, height: size.height * 4 / 5),
          // QRScanView(
          //   qrViewController: qrViewController,
          // ),
          Container(),
          TransferScreen(
            user: user,
          ),
        ],
      ),
    );
  }

  void _onTabChange(int index) {
    if (index != 1) {
      qrViewController?.pauseCamera();
    } else {
      qrViewController?.resumeCamera();
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
