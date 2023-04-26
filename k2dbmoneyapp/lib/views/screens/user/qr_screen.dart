import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text.dart';
import 'Modal/User.dart';

class QRScreen extends StatefulWidget {
  static const String routeName = '/qr_screen';
  User user;

  QRScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late User user = widget.user;

  QRViewController? qrViewController;
  int _currentIndex = 0;
  bool _flash = false;

  Barcode? result;

  final List<String> appBarName = ["Payment QR", "Scan QR", "Transfer"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        shadowColor: ColorsApp.primaryColor,
        title: Text(
          appBarName[_currentIndex],
          style: TextStyles.defaultStyle.bold.sizeHeading.colorAppBarText,
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
      ),
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
          PaymentQRView(user: user, height: size.height * 4 / 5),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: k12Margin),
                child: Text(
                  "Adjust camera position to scan QR code",
                  style: TextStyles.defaultStyle.bold.colorDeepBlueText,
                ),
              ),
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlayMargin: const EdgeInsets.all(k12Margin),
                  overlay:
                      QrScannerOverlayShape(borderRadius: kBorderRadiusMax),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: k12Margin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        //TODO Open Photo Gallery
                      },
                      icon: const Icon(FontAwesomeIcons.images),
                      color: ColorsApp.primaryColor,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Scanning for QR code",
                        ),
                        Text(
                          result?.code ?? "{result here}",
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: _btnCameraFlash,
                      icon: Icon(_flash
                          ? FontAwesomeIcons.solidLightbulb
                          : FontAwesomeIcons.lightbulb),
                      color: ColorsApp.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    // TODO Pause QR View on created
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _btnCameraFlash() {
    var flashStatus = qrViewController?.getFlashStatus();
    qrViewController?.toggleFlash();
    setState(() {
      _flash = !_flash;
    });
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

class PaymentQRView extends StatelessWidget {
  const PaymentQRView({
    super.key,
    required this.user,
    required this.height,
  });

  final User user;
  final double? height;

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
                      height: height! * 0.1),
                ),
                Text(
                  user.userName.toUpperCase(),
                  style: TextStyles.defaultStyle.sizeHeading.semiBold,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: k12Margin),
                    decoration: BoxDecoration(
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
                    child: QrImage(
                      data: user.security.phoneNum,
                      padding: const EdgeInsets.all(k24Padding),
                      backgroundColor: ColorsApp.backgroundLight,
                      foregroundColor: ColorsApp.primaryColor,
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
