import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../constant/color.dart';
import '../constant/dimension.dart';
import '../constant/text.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({Key? key, required this.fieldText, this.hintText})
      : super(key: key);
  final TextEditingController fieldText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      //long-pressing the TextField to select text and show the cut/copy/paste menu
      controller: fieldText,
      onChanged: (text) {
        TextSelection previousSelection = fieldText.selection;
        fieldText.text = text;
        fieldText.selection = previousSelection;
      },
      cursorColor: ColorsApp.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: k12Padding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMax),
          borderSide: const BorderSide(
              color: ColorsApp.primaryColor,
              width: 0.8,
              style: BorderStyle.none),
        ),
        hintText: hintText ?? 'Search',
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
