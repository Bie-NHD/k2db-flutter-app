import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field.dart';

import '../../../core/widgets/widget_itembutton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const routeName = "/sign_in_screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final fieldText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: k12Padding,
              right: k12Padding,
              child: HelperImage.loadFromAsset(HelperAssets.signIn,
                  width: size.width * 0.95, fit: BoxFit.contain),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 2 / 3,
                decoration: BoxDecoration(
                  color: ColorsApp.backgroundLight,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadiusMax),
                      topRight: Radius.circular(kBorderRadiusMax)),
                  border:
                      Border.all(color: ColorsApp.hintTextColor, width: 0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: k12Padding, vertical: k24Padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone Verification",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: k12Padding),
                      const Text(
                        "Enter your phone number to use the app. We need to register your phone without getting started!",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: k24Padding),
                      TextFieldInput(
                        keyboardType: TextInputType.number,
                        fieldText: fieldText,
                        labelText: "Phone number",
                        hintText: "Enter your phone number",
                        prefixIcon: const Icon(
                          FontAwesomeIcons.phone,
                          size: kIconSize,
                          color: ColorsApp.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      ButtonFill(
                        text: "Continue",
                        onTap: () {
                          Navigator.of(context).pushNamed("/main_page");
                        },
                      ),
                      const SizedBox(
                        height: k24Padding,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
