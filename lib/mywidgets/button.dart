import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  late Color foregroundColor;
  late Color backGroundColor;

  MyButton({super.key, this.text = "", this.onPress});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ElevatedButton(onPressed: onPressed, child: child)

    return TextButton(
      onPressed: widget.onPress,
      child: Text(widget.text),
    );
  }
}
