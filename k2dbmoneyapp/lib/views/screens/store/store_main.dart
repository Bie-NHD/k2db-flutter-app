import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_asset.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_image.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_double.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_date.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
import '../../../../core/constant/text.dart';
class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);
  static const routeName = "/store_screen";
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsApp.backgroundLight,
          title : const Text("Store",
            style : TextStyle(
              color: ColorsApp.headingTextColor,
              fontWeight: FontWeight.bold,
            )
          ),
        centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(38),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: k12Padding, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.79,
                    // padding: const EdgeInsets.only(left: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm',
                        hintStyle: TextStyle(
                          color: ColorsApp.headingTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,
                          size: kIconSize,
                          color: ColorsApp.backgroundDark,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.map,
                      size: kIconSize,
                      color: ColorsApp.backgroundDark,),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
