import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({
    super.key,
  });

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  bool _flash = false;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
