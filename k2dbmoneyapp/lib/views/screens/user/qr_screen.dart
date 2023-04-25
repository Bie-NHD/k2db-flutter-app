import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  late TabController _tabController;
  QRViewController? qrViewController;
  int _currentIndex = 0;
  bool _flash = false;

  late List<Widget> screens = [
    QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    ),
    const Text("Second tab"),
  ];

  Barcode? result;

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
    double? height = size.height * 4 / 5;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [ColorsApp.statusNoteColor, ColorsApp.primaryColor],
              stops: [0.3, 0.7])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text(
            "QR Code",
            style: TextStyles.defaultStyle.bold.sizeHeading.colorAppBarText,
          ),
          centerTitle: true,
          backgroundColor: ColorsApp.statusNoteColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
          actions: [],
        ),
        body: Stack(
          children: [
            Positioned(
              top: k12Padding,
              left: k12Padding,
              right: k12Padding,
              child: Container(
                height: height,
                // color: Colors.yellow,
                child: IndexedStack(
                  index: _currentIndex,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Adjust camera position to scan QR code",
                          style: TextStyles
                              .defaultStyle.sizeTitleAndButton.colorAppBarText,
                        ),
                        // Text(qrViewController?.getFlashStatus().toString() ?? ""),
                        const SizedBox(
                          height: k12Padding,
                        ),
                        Expanded(
                          flex: 5,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: _btnCameraFlash,
                            icon: Icon(_flash
                                ? FontAwesomeIcons.solidLightbulb
                                : FontAwesomeIcons.lightbulb),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Scanning for QR code",
                          style: TextStyles
                              .defaultStyle.sizeDefault.colorAppBarText,
                        ),
                        Text(
                          result?.code ?? "{result here}",
                          style: TextStyles
                              .defaultStyle.sizeDefault.colorAppBarText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            // height: height * 0.7,
                            margin: const EdgeInsets.symmetric(
                                vertical: k24Padding),
                            padding: const EdgeInsets.all(k24Padding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadiusMin),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: HelperImage.loadFromAsset(
                                      user.userAvatar,
                                      height: height * 0.1),
                                ),
                                Text(
                                  user.userName.toUpperCase(),
                                  style: TextStyles
                                      .defaultStyle.sizeHeading.semiBold,
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: k24Padding),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorsApp.tertiaryColors,
                                            width: 5),
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadiusMax)),
                                    child: QrImage(
                                      data: user.security.phoneNum,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: k24Padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                  onPressed: () {
                                    //TODO Render Image
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.download,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Download",
                                    style:
                                        TextStyles.defaultStyle.colorAppBarText,
                                  )),
                              TextButton.icon(
                                  onPressed: () {
                                    //TODO System share
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.share,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Share",
                                    style:
                                        TextStyles.defaultStyle.colorAppBarText,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: k12Padding,
              right: k12Padding,
              bottom: k12Padding,
              child: TabBar(
                controller: _tabController,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: k12Padding),
                labelColor: Colors.white,
                unselectedLabelColor: ColorsApp.backgroundLight,
                labelStyle: TextStyles.defaultStyle.semiBold.colorDefaultText,
                indicator: BoxDecoration(
                    color: ColorsApp.statusNoteColor,
                    borderRadius: BorderRadius.circular(kBorderRadiusMin)),
                onTap: _onTabChange,
                tabs: const [
                  Tab(
                    text: "Scan",
                  ),
                  Tab(
                    text: "User QR",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
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
    _tabController.animateTo(index);
    if (index == 1) {
      qrViewController?.pauseCamera();
    } else {
      qrViewController?.resumeCamera();
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
