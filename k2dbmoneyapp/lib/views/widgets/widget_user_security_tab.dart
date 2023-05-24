import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/views/screens/others/CCCDScanScreen.dart';
import 'package:k2dbmoneyapp/views/screens/others/citizen_scan.dart';

import '../../core/model/user.dart';

class SecurityTab extends StatelessWidget {
  SecurityTab({super.key, required this.user});

  final User user;
  late List<SecurityItem> list = [
    SecurityItem(
        checker: user.citizenID != null,
        contentTrue: user.citizenID,
        icon: FontAwesomeIcons.idCardClip,
        screen: Screens.CITIZENID),
    SecurityItem(
        checker: user.userPIN != null,
        contentTrue: _pinCaster(user.userPIN),
        icon: FontAwesomeIcons.lock,
        screen: Screens.PIN),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: k12Padding),
      itemBuilder: (context, index) => SecurityTile(info: list[index]),
    );
  }

  String? _pinCaster(String? PIN) {
    if (PIN == null) {
      return "";
    } else {
      int length = PIN.length;
      const String symbol = "\u2022";
      return PIN.replaceRange(0, length, symbol * length);
    }
  }
}

class SecurityItem {
  final bool checker;
  final String? contentTrue;
  final String? contentFalse;
  final IconData? icon;
  final screen;

  const SecurityItem(
      {required this.checker,
      required this.contentTrue,
      this.contentFalse = "",
      this.icon,
      required this.screen});
}

class SecurityTile extends StatelessWidget {
  final SecurityItem info;

  const SecurityTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (info.checker == false) {
          // TODO initiate screens
          switch (info.screen) {
            case Screens.CITIZENID:
              {
                // TODO Citizen ID Screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CitizenIDScan()));
                break;
              }

            case Screens.PIN:
              {
                // TODO PIN Screen
                Container();
                break;
              }
            case Screens.FACIAL:
              {
                // TODO facial recognition Screen
                Container();
                break;
              }
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: k8Margin),
        padding: const EdgeInsets.symmetric(horizontal: k8Padding),
        decoration: BoxDecoration(
          color: info.checker
              ? ColorsApp.statusSuccessColor
              : ColorsApp.statusNoteColor,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
        ),
        child: ListTile(
          title: Text(info.checker
              ? info.contentTrue ?? "String Error"
              : info.contentFalse ?? "String Error"),
          leading: Icon(
            info.icon,
            color: info.checker
                ? ColorsApp.backgroundLight
                : ColorsApp.secondaryColor,
          ),
          textColor: info.checker
              ? ColorsApp.backgroundLight
              : ColorsApp.secondaryColor,
        ),
      ),
    );
  }
}

enum Screens { CITIZENID, PIN, FACIAL }
