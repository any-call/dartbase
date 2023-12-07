import 'package:flutter/cupertino.dart';

class MyLabel {
  static Widget singleLineText(String data,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return Text(
      data,
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
