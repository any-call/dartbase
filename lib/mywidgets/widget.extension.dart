import 'package:flutter/material.dart';

extension MyWidget on Widget {
  SizedBox SetSizebox({Key? key, double? width, double? height}) {
    return SizedBox(key: key, width: width, height: height, child: this);
  }

  ///设置对齐
  Align SetAlign(Alignment alignment, {Key? key}) {
    return Align(
      key: key,
      alignment: alignment,
      child: this,
    );
  }

  ///设置外边距
  Padding SetPadding(EdgeInsets edgeInsets, {Key? key}) {
    return Padding(key: key, padding: edgeInsets, child: this);
  }

  ///设置Center
  Center SetCenter({Key? key}) {
    return Center(key: key, child: this);
  }

  /// only row/cloumn 的子元素可用
  Expanded SetExpand({Key? key, int flex = 1}) {
    return Expanded(key: key, flex: flex, child: this);
  }

  //设置容器
  Container SetContainer(
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
        clipBehavior: clipBehavior);
  }
}
