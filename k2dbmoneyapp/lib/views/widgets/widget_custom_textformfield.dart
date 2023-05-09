import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import '../../../core/constant/text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.labelText,
    this.helperText,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.showCounter = false,
    this.controller,
    this.onSaved,
    this.prefixIcon,
  });

  final String? hintText;
  final String labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final bool enabled;
  final bool showCounter;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k8Padding),
      child: TextFormField(
        key: key,
        controller: controller,
        maxLength: 100,
        enabled: enabled,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          helperText: helperText ?? "",
          hintText: hintText ?? "",
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsApp.tertiaryColors),
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsApp.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle:
              TextStyles.defaultStyle.bold.sizeTitleAndButton.colorDeepBlueText,
          counter: showCounter ? null : const SizedBox.shrink(),
          prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}
