import 'package:flutter/material.dart';

class AppDecoration {
  static final containerBorder = BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: Colors.white60);

  static BoxDecoration containerStyle(
      {required Color color, double radius = 10}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }
}
