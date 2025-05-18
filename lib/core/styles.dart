import 'package:flutter/cupertino.dart';

class Styles {
  static const double xlPadding = 24;
  static const double lgPadding = 20;
  static const double mdPadding = 16;
  static const double smPadding = 12;
  static const double xsPadding = 8;
  static const double xxsPadding = 4;

  static const double xlSpacing = 24;
  static const double lgSpacing = 20;
  static const double mdSpacing = 16;
  static const double smSpacing = 12;
  static const double xsSpacing = 8;
  static const double xxsSpacing = 4;

  static const double lgRadius = 16;
  static const double mdRadius = 12;

  static const double lgIcon = 24;
  static const double mdIcon = 16;
  static const double smIcon = 12;

  static const List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Color(0x02000000),
      blurRadius: 6.77,
      offset: Offset(0, 1.46),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x03000000),
      blurRadius: 24.85,
      offset: Offset(0, 4.91),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x05000000),
      blurRadius: 80,
      offset: Offset(0, 22),
      spreadRadius: 0,
    )
  ];
}
