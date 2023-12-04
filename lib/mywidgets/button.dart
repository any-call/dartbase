import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  late Color? _foregroundColor;
  late Color? _backGroundColor;

  MyButton({super.key, this.text = "", this.onPress});

  set foregroundColor(Color color) {
    _foregroundColor = color;
  }

  set backgroundColr(Color color) {
    _backGroundColor = color;
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
    print(" run 1204...002");
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
