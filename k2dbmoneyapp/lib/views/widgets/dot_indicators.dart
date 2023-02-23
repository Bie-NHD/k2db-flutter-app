import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? k12Padding : k8Padding / 2,
      width: k8Padding / 2,
      decoration: const BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadiusMin))),
    );
  }
}
