import 'package:flutter/material.dart';

import 'color.dart';

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
      fontSize: 14,
      color: ColorsApp.defaultTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Nunito");
}
