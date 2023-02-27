import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/constant/text.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

class ItemSearch extends StatelessWidget {
  const ItemSearch(
      {Key? key,
      required this.hintText,
      this.onChange,
      required this.controller,
      this.onPress})
      : super(key: key);
  final String hintText;
  final Function()? onChange, onPress;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      //onChange:,
      cursorColor: ColorsApp.primaryColor,
      //TODO: FocusNode
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: k12Padding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMax),
          borderSide: const BorderSide(
              color: ColorsApp.primaryColor,
              width: 0.8,
              style: BorderStyle.none),
        ),
        hintText: hintText,
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
            size: kIconSize,
          ),
          onPressed: () {
            controller.clear();
          },
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadiusMax,
            ),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.tertiaryColors, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadiusMax,
            ),
          ),
        ),
      ),
    );
  }
}
