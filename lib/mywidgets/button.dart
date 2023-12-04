import 'package:flutter/material.dart';

enum MyButtonType {
  raise,
  text,
  icon,
}

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  final MyButtonType type;
  late Color? _foregroundColor;
  late Color? _backGroundColor;
  late double? _fontSize;
  late FontStyle? _fontStyle;

  MyButton(
      {super.key,
      this.text = "",
      this.type = MyButtonType.raise,
      this.onPress});

  MyButton setForegroundColor(Color color) {
    _foregroundColor = color;
    return this;
  }

  MyButton setBackgroundColor(Color color) {
    _backGroundColor = color;
    return this;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    print(" run 1204...007");

    if (widget.type == MyButtonType.raise) {
      return ElevatedButton(
        onPressed: widget.onPress,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(widget._foregroundColor),
          backgroundColor: MaterialStateProperty.all(widget._backGroundColor),
        ),
        child: Text(
          widget.text,
          // style: TextStyle(
          //   fontSize: widget._fontSize ?? 14,
          //   fontStyle: widget._fontStyle ?? FontStyle.normal,
          // ),
        ),
      );
    }

    return TextButton(
      onPressed: widget.onPress,
      child: Text(
        widget.text,
        style: TextStyle(
            backgroundColor: widget._backGroundColor,
            color: widget._foregroundColor),
      ),
    );
  }
}
