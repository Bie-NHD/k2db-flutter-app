import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';

import '../constant/color.dart';
import '../constant/dimension.dart';
import '../constant/text.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key? key,
    required this.fieldText,
    this.hintText,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
  }) : super(key: key);
  final TextEditingController fieldText;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? labelText;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      //long-pressing the TextField to select text and show the cut/copy/paste menu
      controller: fieldText,
      keyboardType: keyboardType,
      onChanged: (text) {
        TextSelection previousSelection = fieldText.selection;
        fieldText.text = text;
        fieldText.selection = previousSelection;
      },
      cursorColor: ColorsApp.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: k12Padding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
          borderSide: const BorderSide(
              color: ColorsApp.primaryColor,
              width: 0.8,
              style: BorderStyle.none),
        ),
        labelText: labelText ?? "Label",
        labelStyle: TextStyles.defaultStyle.colorHeadingText,
        hintText: hintText ?? 'Enter...',
        hintMaxLines: 1,
        hintStyle: TextStyles.defaultStyle.colorHintText,
        prefixIcon: prefixIcon ?? const SizedBox(width: kIconSize),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadiusMin,
            ),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kBorderRadiusMin,
            ),
          ),
        ),
      ),
    );
  }
}
