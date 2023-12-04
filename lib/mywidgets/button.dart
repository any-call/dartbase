import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  late Color? _foregroundColor;
  late Color? _backGroundColor;

  MyButton({super.key, this.text = "", this.onPress});

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
    // return ElevatedButton(onPressed: onPressed, child: child)
    print(" run 1204...003");
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
