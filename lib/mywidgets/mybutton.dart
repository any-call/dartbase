import 'package:flutter/material.dart';

enum MyButtonType { elevate, text, outlined }

extension MyButton on ButtonStyleButton {
  Widget SetFixSize(double? width, double? heigh) {
    if (width != null && heigh != null) {
      return Container(width: width, height: heigh, child: this);
    } else if (width != null) {
      return Container(width: width, child: this);
    } else if (heigh != null) {
      return Container(height: heigh, child: this);
    }

    return this;
  }

  static ButtonStyleButton myTextBtn(MyButtonType type,
      {Key? key,
      String label = "",
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      double fontSize = 14,
      VoidCallback? onPressed,
      VoidCallback? onLongPress,
      ValueChanged<bool>? onHover,
      VoidCallback? onFocusChange,
      Color? foregroundColor,
      Color? backGroundColor,
      Color? hoverColor}) {
    if (type == MyButtonType.elevate) {
      return ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          style: _genMyButtonStyle(
              foregroundColor: foregroundColor,
              backGroundColor: backGroundColor,
              hoverColor: hoverColor),
          child: _genMyTxtChild(label,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              fontSize: fontSize));
    } else if (type == MyButtonType.outlined) {
      return OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          style: _genMyButtonStyle(
              foregroundColor: foregroundColor,
              backGroundColor: backGroundColor,
              hoverColor: hoverColor),
          child: _genMyTxtChild(label,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              fontSize: fontSize));
    }

    return TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        style: _genMyButtonStyle(
            foregroundColor: foregroundColor,
            backGroundColor: backGroundColor,
            hoverColor: hoverColor),
        child: _genMyTxtChild(label,
            fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize));
  }

  static ButtonStyleButton myIconLabelBtn(MyButtonType type, IconData icon,
      {Key? key,
      String label = "",
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      double fontSize = 14,
      VoidCallback? onPressed,
      VoidCallback? onLongPress,
      ValueChanged<bool>? onHover,
      VoidCallback? onFocusChange,
      Color? foregroundColor,
      Color? backGroundColor,
      Color? hoverColor}) {
    if (type == MyButtonType.elevate) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        icon: Icon(icon),
        label: _genMyTxtChild(label,
            fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize),
        style: _genMyButtonStyle(
            foregroundColor: foregroundColor,
            backGroundColor: backGroundColor,
            hoverColor: hoverColor),
      );
    } else if (type == MyButtonType.outlined) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        icon: Icon(icon),
        label: _genMyTxtChild(label,
            fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize),
        style: _genMyButtonStyle(
            foregroundColor: foregroundColor,
            backGroundColor: backGroundColor,
            hoverColor: hoverColor),
      );
    }

    return TextButton.icon(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      icon: Icon(icon),
      label: _genMyTxtChild(label,
          fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize),
      style: _genMyButtonStyle(
          foregroundColor: foregroundColor,
          backGroundColor: backGroundColor,
          hoverColor: hoverColor),
    );
  }

  static ButtonStyle _genMyButtonStyle(
      {Color? foregroundColor, Color? backGroundColor, Color? hoverColor}) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all(foregroundColor),
      backgroundColor: MaterialStateProperty.all(backGroundColor),
      overlayColor: MaterialStateProperty.all(hoverColor),
    );
  }

  static Text _genMyTxtChild(String string,
      {FontStyle? fontStyle, FontWeight? fontWeight, double? fontSize}) {
    return Text(
      string,
      style: TextStyle(
        fontStyle: fontStyle,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
