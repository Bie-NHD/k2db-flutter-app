import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';
import 'package:k2dbmoneyapp/views/screens/authen/main_page.dart';
import 'package:k2dbmoneyapp/views/screens/home/home_main.dart';

import '../../../core/constant/text.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key, required this.message}) : super(key: key);

  static const routeName = "/success_page";
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(k24Padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: ColorsApp.statusSuccessColor,
                child: Icon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
                message,
                style: TextStyles.defaultStyle.sizeHeading,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: k8Padding,
              ),
              ButtonFill(
                  text: "Return Home",
                  onTap: () {
                    Navigator.popAndPushNamed(context, MainPage.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
