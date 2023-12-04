import 'package:flutter/material.dart';

class MyButtonEx {
  ///OutlinedButton
  static OutlinedButton outlineButton({
    Key? key,
    String label = "",
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double fontSize = 14,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    VoidCallback? onFocusChange,
    Color? foregroundColor,
    Color? backGroundColor,
    Color? hoverColor,
  }) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          backgroundColor: MaterialStateProperty.all(backGroundColor),
          overlayColor: MaterialStateProperty.all(hoverColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ));
  }

  ///OutlinedButton.icon
  static OutlinedButton outlineIconButton(
    IconData icon, {
    Key? key,
    String label = "",
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double fontSize = 14,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    VoidCallback? onFocusChange,
    Color? foregroundColor,
    Color? backGroundColor,
    Color? hoverColor,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        backgroundColor: MaterialStateProperty.all(backGroundColor),
        overlayColor: MaterialStateProperty.all(hoverColor),
      ),
      label: Text(
        label,
        style: TextStyle(
          fontStyle: fontStyle,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      icon: Icon(icon),
    );
  }
}
