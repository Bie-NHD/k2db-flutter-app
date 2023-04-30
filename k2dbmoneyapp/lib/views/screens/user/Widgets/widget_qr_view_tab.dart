import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/text.dart';
import '../Modal/User.dart';

class UserPaymentQR extends StatelessWidget {
  const UserPaymentQR({
    super.key,
    required this.user,
    required this.height,
  });

  final User user;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment QR",
          style: TextStyles.defaultStyle.sizeAppbar.colorAppBarText,
        ),
        centerTitle: true,
      ),
      body: Column(
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
                      padding: const EdgeInsets.all(k12Padding),
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
                      child: QrImage(
                        data: user.security.phoneNum,
                        padding: const EdgeInsets.all(k24Padding),
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
      ),
    );
  }
}
