import 'package:flutter/material.dart';

extension OutlinedButtonExtension on OutlinedButton {
  static OutlinedButton myOutlineBtn(
      {Key? key,
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
      Color? hoverColor}) {
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
}

class MyButton {
  ///OutlinedButton
  static Widget outlineBtn(
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = OutlinedButton(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }

  ///OutlinedButton.icon
  static Widget iconBtnByOutline(IconData icon,
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = OutlinedButton.icon(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }

  ///ElevatedButton
  static Widget elevateBtn(
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = ElevatedButton(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }

  ///ElevateButton.icon
  static Widget iconBtnByElevate(IconData icon,
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = ElevatedButton.icon(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }

  ///TextButton
  static Widget textBtn(
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = TextButton(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }

  ///ElevateButton.icon
  static Widget iconBtnByText(IconData icon,
      {Key? key,
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
      double? fixWidth,
      double? fixHeight}) {
    final ret = TextButton.icon(
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

    if (fixWidth != null && fixHeight != null) {
      return Container(width: fixWidth, height: fixHeight, child: ret);
    } else if (fixWidth != null) {
      return Container(width: fixWidth, child: ret);
    } else if (fixHeight != null) {
      return Container(height: fixHeight, child: ret);
    }
    return ret;
  }
}
