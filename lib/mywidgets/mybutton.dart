import 'package:flutter/material.dart';

class MyButtonEx<T extends ButtonStyleButton> {
  late T _button;
  MyButtonEx();

  ///OutlinedButton
  static MyButtonEx<OutlinedButton> outlineButton(
      {VoidCallback? onPressed, required Widget child}) {
    final myButton = MyButtonEx<OutlinedButton>();
    myButton._button = OutlinedButton(onPressed: onPressed, child: child);
    return myButton;
  }

  T get button {
    return this._button;
  }
}
