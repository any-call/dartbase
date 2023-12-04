import 'package:flutter/material.dart';

class MyButtonEx<T extends ButtonStyleButton> {
  late T _button;
  MyButtonEx();

  void setColor(Color color) {
    if (_button.style == null) {
      _button.style =
          ButtonStyle(foregroundColor: MaterialStateProperty.all(color));
    } else {
      _button.style?.foregroundColor = MaterialStateProperty.all(color);
    }
  }

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
