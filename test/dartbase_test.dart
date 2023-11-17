import 'package:dartbase/mynet/base.exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test doReq", () {
    final aa = NetWorkException(10, 'this is test');
    print("aa is $aa");
  });

  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });
}
