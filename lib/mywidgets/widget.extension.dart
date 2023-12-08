import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension MyWidget on Widget {
  SizedBox setSizebox({Key? key, double? width, double? height}) {
    return SizedBox(key: key, width: width, height: height, child: this);
  }

  ///设置对齐
  Align setAlign(Alignment alignment, {Key? key}) {
    return Align(
      key: key,
      alignment: alignment,
      child: this,
    );
  }

  ///设置外边距
  Padding setPadding(EdgeInsets edgeInsets, {Key? key}) {
    return Padding(key: key, padding: edgeInsets, child: this);
  }

  ///设置Center
  Center setCenter({Key? key}) {
    return Center(key: key, child: this);
  }

  /// only row/cloumn 的子元素可用
  Expanded setExpand({Key? key, int flex = 1}) {
    return Expanded(key: key, flex: flex, child: this);
  }

  SingleChildScrollView setSingleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: this,
    );
  }

  //设置容器
  Container setContainer(
      {Key? key,
      AlignmentGeometry? alignment,
      AlignmentGeometry? transformAlignment,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Color? color,
      Decoration? decoration,
      Decoration? foregroundDecoration,
      double? width,
      double? height,
      BoxConstraints? constraints,
      Matrix4? transform,
      Clip clipBehavior = Clip.none}) {
    return Container(
      key: key,
      alignment: alignment,
      transformAlignment: transformAlignment,
      padding: padding,
      margin: margin,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      transform: transform,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
