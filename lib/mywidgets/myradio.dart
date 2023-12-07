import 'package:flutter/material.dart';

class MyRadio {
  static Widget radio<T>(T value, T selectValue, ValueChanged<T?> onChanged,
      {required Widget title, double space = 0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(value: value, groupValue: selectValue, onChanged: onChanged),
        SizedBox(width: space),
        title,
      ],
    );
  }
}
