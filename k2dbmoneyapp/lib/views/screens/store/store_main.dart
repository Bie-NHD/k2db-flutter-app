import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);
  static const routeName = "/store_screen";

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    fieldText.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree and removes the _printLatestValue listener.
    fieldText.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    // ignore: avoid_print
    print('Second text field: ${fieldText.text}');
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: ColorsApp.primaryColor,
            title: Text(
              "Store",
              style:
                  TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
            ),
            actions: [
              IconButton(
                padding: const EdgeInsets.all(k12Padding),
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.map,
                  size: kIconSize - 2,
                ),
                tooltip: "Map",
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: k12Padding, vertical: k12Padding),
            child: Column(
              children: [
                TextField(
                  enableInteractiveSelection:
                      true, //long-pressing the TextField to select text and show the cut/copy/paste menu
                  controller: fieldText,
                  onChanged: (text) {
                    TextSelection previousSelection = fieldText.selection;
                    fieldText.text = text;
                    fieldText.selection = previousSelection;
                    // setState(() {
                    //   fieldText.text = text;
                    // });
                  },
                  cursorColor: ColorsApp.primaryColor,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: k12Padding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kBorderRadiusMax),
                      borderSide: const BorderSide(
                          color: ColorsApp.primaryColor,
                          width: 0.8,
                          style: BorderStyle.none),
                    ),
                    hintText: 'Search Store',
                    hintMaxLines: 1,
                    hintStyle: TextStyles.defaultStyle.colorHintText,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: ColorsApp.hintTextColor,
                      size: kIconSize,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.xmark,
                        color: ColorsApp.hintTextColor,
                        size: kIconSize - 4,
                      ),
                      onPressed: () {
                        fieldText.clear();
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.primaryColor, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kBorderRadiusMax,
                        ),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.tertiaryColors, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kBorderRadiusMax,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
