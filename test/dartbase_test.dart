import 'package:dartbase/mynet.dart';

void main() async {
  await MyDio.instance
      .doGet('http://43.227.112.121:18081/api/site/sync')
      .then((value) {
    print("ret is :$value");
  }).catchError((error) {
    print("error is :$error");
  });
}
