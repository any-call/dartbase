import 'dart:io';

import 'package:file_selector/file_selector.dart';

class MyFile {
  //检测文件件
  static bool isFolder(String path) {
    return FileSystemEntity.isDirectorySync(path);
  }

  static bool isFile(String path) {
    return FileSystemEntity.isFileSync(path);
  }

  static bool isExist(String path) {
    return MyFile.isExistFolder(path) ? true : MyFile.isExistFile(path);
  }

  static bool isExistFolder(String path) {
    Directory dir = Directory(path);
    return dir.existsSync();
  }

  static bool isExistFile(String path) {
    File txt = File(path);
    return txt.existsSync();
  }

  ///读取指定文件
  static Future readFileAsBytes(String path) {
    final file = File(path);
    return file.readAsBytes();
  }

  static Future readFileAsString(String path) {
    final file = File(path);
    return file.readAsString();
  }

  ///文件选择框
  static Future<XFile?> selectFile(
    List<String> listExt, {
    String? label,
  }) {
    XTypeGroup typeGroup = XTypeGroup(label: label, extensions: listExt);
    return openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
  }
}
