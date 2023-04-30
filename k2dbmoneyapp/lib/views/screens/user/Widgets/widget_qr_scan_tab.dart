import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/text.dart';

class QRScanView extends StatefulWidget {
  QRViewController? qrViewController;

  QRScanView({super.key, required this.qrViewController});

  @override
  State<QRScanView> createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  bool _flash = false;
  Barcode? result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrViewController = widget.qrViewController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan QR",
          style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText,
        ),
        centerTitle: true,
      ),
      body: Column(
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
              overlay: QrScannerOverlayShape(borderRadius: kBorderRadiusMax),
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
    );
  }

  void _btnCameraFlash() {
    // var flashStatus = qrViewController?.getFlashStatus();
    qrViewController?.toggleFlash();
    setState(() {
      _flash = !_flash;
    });
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

  static void pauseCamera() {}
}
