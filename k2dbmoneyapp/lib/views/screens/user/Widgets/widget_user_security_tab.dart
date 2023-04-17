import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

import '../Modal/User.dart';

class SecurityTab extends StatelessWidget {
  SecurityTab({super.key, required this.user}) : security = user.security;

  User user;
  late Security security;
  late List<SecurityInfo> list = [
    SecurityInfo(
        checker: security.hasValidatedCitizenID,
        data: security.citizenID,
        icon: FontAwesomeIcons.idCardClip),
    SecurityInfo(
        checker: security.hasPIN,
        data: _PINCaster(security.PIN),
        icon: FontAwesomeIcons.lock),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => SecurityTile(info: list[index]),
    );
  }

  String? _PINCaster(String? PIN) {
    if (PIN == null) {
      return "";
    } else {
      int length = PIN.length;
      return PIN.replaceRange(0, length, "\u2022");
    }
  }
}

class SecurityInfo {
  final bool checker;
  final String? data;
  final IconData? icon;

  const SecurityInfo({required this.checker, required this.data, this.icon});
}

class SecurityTile extends StatelessWidget {
  final SecurityInfo info;

  const SecurityTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: info.checker
                ? ColorsApp.statusSuccessColor
                : ColorsApp.statusNoteColor),
        child: ListTile(
          title: Text(info.data ?? ""),
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
