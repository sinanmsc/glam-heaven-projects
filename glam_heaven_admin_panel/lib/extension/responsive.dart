import 'package:flutter/material.dart';

extension ResponsiveSize on BuildContext {
  double width(double width) {
    return MediaQuery.sizeOf(this).width * (width / 1846);
  }

  double height(double height) {
    return MediaQuery.sizeOf(this).height * (height / 1846);
  }
}
