import 'package:flutter/material.dart';

extension MyWidget on Widget {
  Widget SetFixSize({double? width, double? heigh}) {
    if (width != null && heigh != null) {
      return SizedBox(width: width, height: heigh, child: this);
    } else if (width != null) {
      return SizedBox(width: width, child: this);
    } else if (heigh != null) {
      return SizedBox(height: heigh, child: this);
    }

    return this;
  }
}
