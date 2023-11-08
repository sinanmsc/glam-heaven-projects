import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
//  push
  to(Widget route) {
    return Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => route,
        ));
  }
}
