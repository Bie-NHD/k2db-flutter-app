import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import 'package:k2dbmoneyapp/views/widgets/widget_card_function.dart';

import '../../core/constant/color.dart';
import '../../core/constant/dimension.dart';
import '../../core/constant/text.dart';

// Inherit from CardItemFunction
class FilledCardItemFunction extends CardItemFunction {
  final Color backgroundColor;
  // Container width + height
  // Default a square
  final double? width;
  final double? height;
  final double? size;
  const FilledCardItemFunction({
    super.key,
    required super.icon,
    required super.text,
    super.onTap,
    super.color,
    required this.backgroundColor,
    this.width,
    this.height,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width ?? MediaQuery.of(context).size.width * 0.2,
            height: height ?? MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(kBorderRadiusMin)),
            child: Icon(
              icon,
              size: size ?? kIconSize,
              color: color ?? ColorsApp.backgroundLight,
            ),
          ),
          const SizedBox(height: k8Padding),
          Text(
            text.toUpperCase(),
            style: TextStyles.defaultStyle.bold,
          ),
        ],
      ),
    );
  }
}
