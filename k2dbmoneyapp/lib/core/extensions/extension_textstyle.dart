import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get sizeHeading => copyWith(fontSize: 24);
  TextStyle get sizeAppbar => copyWith(fontSize: 20);
  TextStyle get sizeTitleAndButton => copyWith(fontSize: 16);
  TextStyle get sizeDefault => copyWith(fontSize: 14);
  TextStyle get sizeMin => copyWith(fontSize: 12);

  TextStyle get colorDefaultText => copyWith(color: ColorsApp.defaultTextColor);
  TextStyle get colorDeepBlueText => copyWith(color: ColorsApp.primaryColor);
  TextStyle get colorGrayText => copyWith(color: ColorsApp.secondaryColor);
  TextStyle get colorHeadingText => copyWith(color: ColorsApp.headingTextColor);
  TextStyle get colorTitleText => copyWith(color: ColorsApp.titleTextColor);
  TextStyle get colorHintText => copyWith(color: ColorsApp.hintTextColor);
  TextStyle get colorAppBarText => copyWith(color: ColorsApp.appBarTextColor);
  TextStyle get colorRedText => copyWith(color: ColorsApp.statusErrorColor);
  TextStyle get colorGreenText => copyWith(color: ColorsApp.statusSuccessColor);
  TextStyle get colorBlueText => copyWith(color: ColorsApp.statusNoteColor);
}
