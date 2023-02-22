import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get fontHeading => copyWith(fontSize: 24);
  TextStyle get fontAppbar => copyWith(fontSize: 20);
  TextStyle get fontTitleAndButton => copyWith(fontSize: 16);
  TextStyle get fontDefault => copyWith(fontSize: 14);
  TextStyle get fontMin => copyWith(fontSize: 12);

  TextStyle get colorDefaultText => copyWith(color: ColorsApp.defaultTextColor);
  TextStyle get colorPrimaryText => copyWith(color: ColorsApp.primaryColor);
  TextStyle get colorSecondText => copyWith(color: ColorsApp.secondaryColor);
  TextStyle get colorHeadingText => copyWith(color: ColorsApp.headingTextColor);
  TextStyle get colorTitleText => copyWith(color: ColorsApp.titleTextColor);
  TextStyle get colorHintText => copyWith(color: ColorsApp.hintTextColor);
  TextStyle get colorAppBarText => copyWith(color: ColorsApp.appBarTextColor);
  TextStyle get colorRed => copyWith(color: ColorsApp.statusErrorColor);
}
