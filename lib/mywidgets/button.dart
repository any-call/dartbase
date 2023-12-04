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
  final Color? hoverColor;
  final double? fontSize;
  final FontStyle? fontStyle;
  final double? fixWidth;
  final double? fixHeight;
  final Widget? icon;

  MyButton({
    super.key,
    this.text = "",
    this.type = MyButtonType.raise,
    this.onPress,
    this.foregroundColor,
    this.backGroundColor,
    this.hoverColor,
    this.fontSize,
    this.fontStyle,
    this.fixWidth,
    this.fixHeight,
    this.icon,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {
  Text? _child;
  Text get child {
    if (this._child == null) {
      _child = Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontStyle: widget.fontStyle,
        ),
      );
    }
    return _child!;
  }

  @override
  Widget build(BuildContext context) {
    print(" run 1204...014");
    final Widget button;
    switch (widget.type) {
      case MyButtonType.raise:
        {
          if (widget.icon != null) {
            button = ElevatedButton.icon(
                onPressed: widget.onPress,
                icon: widget.icon!,
                label: this.child);
          } else {
            button = ElevatedButton(
              onPressed: widget.onPress,
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(widget.foregroundColor),
                backgroundColor:
                    MaterialStateProperty.all(widget.backGroundColor),
                overlayColor: MaterialStateProperty.all(widget.hoverColor),
              ),
              child: this.child,
            );
          }
        }
        break;

      case MyButtonType.border:
        {
          if (widget.icon != null) {
            button = OutlinedButton.icon(
                onPressed: widget.onPress,
                icon: widget.icon!,
                label: this.child);
          } else {
            button = OutlinedButton(
              onPressed: widget.onPress,
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(widget.foregroundColor),
                backgroundColor:
                    MaterialStateProperty.all(widget.backGroundColor),
                overlayColor: MaterialStateProperty.all(widget.hoverColor),
              ),
              child: this.child,
            );
          }
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
              overlayColor: MaterialStateProperty.all(widget.hoverColor),
            ),
            child: this.child,
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
