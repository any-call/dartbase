import 'dart:async';

import 'package:flutter/material.dart';

import 'base.dart';

class MyToast {
  OverlayEntry? _overlayEntry;
  Timer? _timer;
  MyToast();
  static final MyToast _instance = MyToast();
  static MyToast get instance => _instance;

  void showSuccess(
    String message,
    BuildContext context, {
    int duration = 2500,
    MyLoadingStyle style = MyLoadingStyle.dark,
    MyLoadingPosition position = MyLoadingPosition.center,
  }) {
    _show(style, MyToastType.success, message, context,
        position: position, duration: duration);
  }

  void showError(
    String message,
    BuildContext context, {
    int duration = 2500,
    MyLoadingStyle style = MyLoadingStyle.dark,
    MyLoadingPosition position = MyLoadingPosition.center,
  }) {
    _show(style, MyToastType.error, message, context,
        position: position, duration: duration);
  }

  void showInfo(
    String message,
    BuildContext context, {
    int duration = 2500,
    MyLoadingStyle style = MyLoadingStyle.dark,
    MyLoadingPosition position = MyLoadingPosition.center,
  }) {
    _show(style, MyToastType.info, message, context,
        position: position, duration: duration);
  }

  void _show(
    MyLoadingStyle style,
    MyToastType type,
    String message,
    BuildContext context, {
    int duration = 2500,
    MyLoadingPosition position = MyLoadingPosition.center,
  }) {
    _timer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (ctx) {
        return MyToastAnimation(
          duration: duration,
          position: position,
          child: MyToastBody(
            style: style,
            type: type,
            message: message,
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    _timer = Timer(Duration(milliseconds: duration), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}

class MyToastBody extends StatelessWidget {
  final MyLoadingStyle style;
  final MyToastType type;
  final String message;

  const MyToastBody({
    super.key,
    this.style = MyLoadingStyle.light,
    required this.type,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Color bgColor, fontColor;
    final IconData icon;
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

    switch (this.type) {
      case MyToastType.success:
        {
          icon = Icons.done;
        }
        break;

      case MyToastType.error:
        {
          icon = Icons.clear;
        }
        break;

      case MyToastType.info:
        {
          icon = Icons.info_outline;
        }
        break;

      default:
        {
          icon = Icons.info;
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
          Icon(
            icon,
            color: fontColor,
            size: 40,
          ),
          SizedBox(
            height: 8,
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

class MyToastAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  final int transitionDuration;
  final MyLoadingPosition position;

  const MyToastAnimation(
      {super.key,
      required this.child,
      this.duration = 2500,
      this.transitionDuration = 300,
      this.position = MyLoadingPosition.center});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyToastAnimationState();
  }
}

class _MyToastAnimationState extends State<MyToastAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.transitionDuration),
    )..forward();
    animation = Tween<double>(begin: -60, end: 60).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    final delay = widget.duration - widget.transitionDuration;
    _timer = Timer(Duration(milliseconds: delay), controller.reverse);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    controller.dispose();
    super.dispose(); // 释放时，请先释放子类，然后再释放根类
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, child) {
        if (widget.position == MyLoadingPosition.center) {
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
        } else {
          return Positioned(
              left: 0,
              right: 0,
              top: widget.position == MyLoadingPosition.top
                  ? animation.value
                  : null,
              bottom: widget.position == MyLoadingPosition.bottom
                  ? animation.value
                  : null,
              child: Center(
                child: widget.child,
              ));
        }
      },
    );
  }
}
