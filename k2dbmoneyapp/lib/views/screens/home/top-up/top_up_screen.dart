import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/icon_textlink.dart';
import 'package:k2dbmoneyapp/core/widgets/widget_itembutton.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/top_up_screen';

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: ColorsApp.primaryColor,
          centerTitle: true,
          title: Text(
            "Top up",
            style: TextStyles.defaultStyle.colorAppBarText.sizeAppbar.semiBold,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  k12Padding, k16Padding, k12Padding, k16Padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Current balance:",
                        style: TextStyles.defaultStyle.sizeAppbar.semiBold,
                      ),
                      const SizedBox(
                        width: k8Padding / 2,
                      ),
                      Text(
                        23239000.0.toFormatMoney(),
                        style: TextStyles.defaultStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: k8Padding),
                  TextField(
                    style: TextStyles.defaultStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: k24Padding),
                      border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kBorderRadiusMin)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsApp.backgroundDark),
                        borderRadius:
                            BorderRadius.all(Radius.circular(kBorderRadiusMin)),
                      ),
                      hintText: "0đ",
                      hintStyle: TextStyles.defaultStyle.colorHintText,
                      labelText: "Amount",
                      labelStyle: TextStyles.defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: k8Padding / 2, thickness: k8Padding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: k8Padding, horizontal: k12Padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Account/Card",
                          style: TextStyles.defaultStyle.sizeAppbar.semiBold
                              .colorDeepBlueText),
                      IconTextLink(title: "Add account", onTap: () {})
                    ],
                  ),
                  ButtonFill(text: "Continue", onTap: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
