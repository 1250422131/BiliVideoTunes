import 'package:flutter/material.dart';


class ScreenSize {
  static const double Small = 200;
  static const double Normal = 450;
  static const double Large = 900;
  static const double ExtraLarge = 1350;
}


double getWindowsWidth(BuildContext context) => MediaQuery.of(context).size.shortestSide;