/// 网络异常类
class MyHttpCode {
  ///未知网络错误
  final int errUnknown;

  ///网络错误
  final int errNet;

  ///网络超时
  final int errConnTimeout;
  final int errSendTimeout;
  final int errReceTimeout;

  ///请求取消
  final int errReqCancel;

  ///JSON解析异常
  final int errParseJson;

  ///数据相关key
  final String respKeyCode;
  final String respKeyMsg;
  final String respKeyData;
  final int respSuccessCode;

  const MyHttpCode(
      {this.errUnknown = -1000,
      this.errNet = -1001,
      this.errConnTimeout = -1002,
      this.errSendTimeout = -1003,
      this.errReceTimeout = -1004,
      this.errReqCancel = -1005,
      this.errParseJson = -1006,
      this.respKeyCode = "code",
      this.respKeyMsg = "message",
      this.respKeyData = "data",
      this.respSuccessCode = 0});
}

class NetWorkException<T> implements Exception {
  int? code;
  String? message;
  T? data;

  NetWorkException(this.code, this.message, {this.data});

  @override
  String toString() {
    // TODO: implement toString
    return '网络异常{code:$code,message:$message,data:$data}';
  }
}
