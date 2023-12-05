import 'dart:core';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:ui' as ui;

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';

enum MyPlatform { android, ios, fuchsia, windows, macos, linux, web, unknown }

class MyUtils {
  static T? ambiguate<T>(T? value) => value;

  ///平台判断
  static MyPlatform currPlatform() {
    if (Platform.isAndroid) {
      return MyPlatform.android;
    }

    if (Platform.isIOS) {
      return MyPlatform.ios;
    }

    if (Platform.isFuchsia) {
      return MyPlatform.fuchsia;
    }

    if (Platform.isWindows) {
      return MyPlatform.windows;
    }

    if (Platform.isMacOS) {
      return MyPlatform.macos;
    }

    if (Platform.isLinux) {
      return MyPlatform.linux;
    }

    return MyPlatform.unknown;
  }

  ///获取屏幕幕大小
  static ui.Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  ///C语言 字符 与 dart 字符串相互转换
  static ffi.Pointer<ffi.Int8> toCStr(String str) {
    return str.toNativeUtf8().cast<ffi.Int8>();
  }

  static String toDartStr(ffi.Pointer<ffi.Int8> cStr) {
    return cStr.cast<Utf8>().toDartString();
  }
}
