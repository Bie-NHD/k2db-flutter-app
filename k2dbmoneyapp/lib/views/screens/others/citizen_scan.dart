import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/DecorationStyles.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/ModalBotoomSheet.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';

class CitizenIDScan extends StatefulWidget {
  const CitizenIDScan({Key? key}) : super(key: key);

  @override
  State<CitizenIDScan> createState() => _CitizenIDScanState();
}

class _CitizenIDScanState extends State<CitizenIDScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;

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
            child: Column(
              children: [
                const Text(
                  "Scanning for QR code",
                ),
                Text(
                  result?.code ?? "{result here}",
                ),
              ],
            ),
          ),
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

    parseData();
  }

  void parseData() {
    List<String> values = result?.code?.split('|') ?? [];
    final List<String> keys = [
      'currentID',
      'prevID',
      'name',
      'birthDate',
      'gender',
      'address',
      'signUpDate'
    ];

    if (values.isEmpty) return log("Citizen ID: no data");

    Map<String, String> data = {};

    for (int i = 0; i < keys.length; i++) {
      data[keys[i]] = values[i];
    }

    showBottomSheet(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: DecorationStyles.boxBorderRadiusMin,
                    color: ColorsApp.backgroundLight),
                child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: k8Padding, horizontal: k12Padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(data.keys.elementAt(index)),
                              Text(data.values.elementAt(index))
                            ],
                          ),
                        )),
              ),
            ));
  }
}
