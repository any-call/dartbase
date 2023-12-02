import 'dart:io';

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
  static Future readFile(String path) {
    final file = File(path);
    return file.readAsBytes();
  }
}
