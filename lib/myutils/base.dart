import 'dart:core';

class MyUtils {
  static T? ambiguate<T>(T? value) => value;

  ///C语言 字符 与 dart 字符串相互转换
  // static String? toString(Pointer<Int8> str) {
  //
  //   return str.value.cast<utf8>().toDartString() ;
  // }

  // static Pointer<Uint8> toCPtr(String string) {
  //   Uint8List units = Utf8Encoder().convert(string) ;
  //
  //
  //
  //
  //   return utf8.decode(string.codeUnits)
  // }
}
