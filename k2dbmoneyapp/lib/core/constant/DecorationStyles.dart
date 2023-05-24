import 'package:flutter/cupertino.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/constant/dimension.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DecorationStyles {
  static const BoxShadow boxShadowBlue = BoxShadow(
      color: Color.fromRGBO(41, 22, 111, 0.5),
      offset: Offset(3, 3),
      blurRadius: 10,
      spreadRadius: 2);
  static const BoxShadow boxShadowGray = BoxShadow(
    color: Color.fromRGBO(183, 179, 178, 0.5),
    offset: Offset(1, 3),
    blurRadius: 5,
  );
  static const BorderRadius boxBorderRadiusMin =
      BorderRadius.all(Radius.circular(kBorderRadiusMin));

  static CustomPaint paintRoundedRectangle(Color color, Size size) =>
      CustomPaint(
        painter: RoundedRectangle(color),
        size: size,
      );
}

class RoundedRectangle extends CustomPainter {
  final Color color;

  const RoundedRectangle(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SemiCircle extends CustomPainter {
  final Color color;
  const SemiCircle(this.color) : super();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, Size.zero.height),
            width: size.width,
            height: size.height),
        math.pi,
        -math.pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
