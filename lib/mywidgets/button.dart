import 'package:flutter/material.dart';

enum MyButtonType {
  raise,
  border,
  text,
}

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  final MyButtonType type;
  final Color? foregroundColor;
  final Color? backGroundColor;
  final double? fontSize;
  final FontStyle? fontStyle;
  final double? fixWidth;
  final double? fixHeight;

  MyButton({
    super.key,
    this.text = "",
    this.type = MyButtonType.raise,
    this.onPress,
    this.foregroundColor,
    this.backGroundColor,
    this.fontSize,
    this.fontStyle,
    this.fixWidth,
    this.fixHeight,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    print(" run 1204...014");
    final Widget button;
    switch (widget.type) {
      case MyButtonType.raise:
        {
          button = ElevatedButton(
            onPressed: widget.onPress,
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(widget.foregroundColor),
              backgroundColor:
                  MaterialStateProperty.all(widget.backGroundColor),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontStyle: widget.fontStyle,
              ),
            ),
          );
        }
        break;

      case MyButtonType.border:
        {
          button = OutlinedButton(
            onPressed: widget.onPress,
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(widget.foregroundColor),
              backgroundColor:
                  MaterialStateProperty.all(widget.backGroundColor),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontStyle: widget.fontStyle,
              ),
            ),
          );
        }
        break;

      default: //TextButton
        {
          button = TextButton(
            onPressed: widget.onPress,
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(widget.foregroundColor),
              backgroundColor:
                  MaterialStateProperty.all(widget.backGroundColor),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontStyle: widget.fontStyle,
              ),
            ),
          );
        }
        break;
    }

    if (widget.fixHeight != null && widget.fixWidth != null) {
      return Container(
          width: widget.fixWidth, height: widget.fixHeight, child: button);
    } else if (widget.fixHeight != null) {
      return Container(height: widget.fixHeight, child: button);
    } else if (widget.fixWidth != null) {
      return Container(width: widget.fixWidth, child: button);
    }

    return button;
  }
}
