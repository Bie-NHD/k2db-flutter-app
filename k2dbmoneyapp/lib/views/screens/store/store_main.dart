import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/widgets/widget-text-field-search.dart';

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
                TextFieldSearch(fieldText: fieldText, hintText: "Search Store")
              ],
            ),
          )),
    );
  }
}
