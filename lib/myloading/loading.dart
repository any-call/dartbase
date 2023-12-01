import 'package:flutter/material.dart';

import 'base.dart';

class Myloading {
  OverlayEntry? _overlayEntry;
  Myloading();
  static final Myloading _instance = Myloading();
  static Myloading get instance => _instance;

  void show(
    BuildContext context, {
    String message = "loading",
    MyLoadingStyle style = MyLoadingStyle.dark,
  }) {
    _show(style, message, context);
  }

  void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _show(MyLoadingStyle style, String message, BuildContext context) {
    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (ctx) {
        return MyloadingAnimation(
          child: MyloadingBody(
            style: style,
            message: message,
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}

class MyloadingBody extends StatelessWidget {
  final MyLoadingStyle style;
  final String message;

  const MyloadingBody({
    super.key,
    this.style = MyLoadingStyle.light,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Color bgColor, fontColor;
    print("this.style : ${this.style}");
    switch (this.style) {
      case MyLoadingStyle.light:
        {
          bgColor = Colors.white;
          fontColor = Colors.black;
        }
        break;

      case MyLoadingStyle.dark:
        {
          bgColor = Colors.black;
          fontColor = Colors.white;
        }
        break;

      default:
        {
          bgColor = Colors.white;
          fontColor = Colors.black;
        }
        break;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(fontColor),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: fontColor,
              decoration: TextDecoration.none, //去掉两个黄色下划线
            ),
          ),
        ],
      ),
    );
  }
}

class MyloadingAnimation extends StatefulWidget {
  final Widget child;
  final int transitionDuration;

  const MyloadingAnimation(
      {super.key, required this.child, this.transitionDuration = 300});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyloadingAnimationState();
  }
}

class _MyloadingAnimationState extends State<MyloadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.transitionDuration),
    )..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose(); // 释放时，请先释放子类，然后再释放根类
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, child) {
        return Opacity(
          opacity: controller.value,
          child: Column(
            children: [
              Expanded(flex: 1, child: Container()),
              widget.child,
              Expanded(flex: 1, child: Container()),
            ],
          ),
        );
      },
    );
  }
}
