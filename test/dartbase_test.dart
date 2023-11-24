import 'package:flutter_test/flutter_test.dart';

void main() {
  // const url = "http://43.227.112.121:18081/api/site/sync";
  // getInstance()
  //     .doReq(url, Method.GET)
  //     .then((value) => {print("enter then $value")})
  //     .whenComplete(() => {print("complete")})
  //     .catchError((onError) => {print("en exception ")});

  Future.wait([
    Future.delayed(Duration(seconds: 2), () {
      return "hello";
    }),
    Future.delayed(Duration(seconds: 10), () {
      return "world";
    }),
  ]).then((value) {
    //执行结果
    print("result is $value");
  }).catchError((e) {
    print("catch error :$e");
  }).whenComplete(() {
    print('run complete');
  })

  print("ret over");
}
