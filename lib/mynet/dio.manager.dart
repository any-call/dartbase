import 'package:dio/dio.dart';

import 'base.exception.dart';

enum Method { GET, POST, PUT, DELETE, PATH }

typedef BaseOptionsFunc = BaseOptions Function();
typedef BaseDataHandleFunc = dynamic Function(
    Response response, MyHttpCode codeDef);
typedef ConfigDioFunc = void Function(Dio dio);

class MyDio {
  late Dio _dio;
  BaseOptionsFunc baseOptionsFunc;
  BaseDataHandleFunc baseDataHandleFunc;
  ConfigDioFunc baseConfigFunc;
  MyHttpCode myHttpCode;

  MyDio(
      {this.baseOptionsFunc = defaultConfigBaseOptions,
      this.baseDataHandleFunc = defaultHandleData,
      this.baseConfigFunc = defaultConfigDio,
      this.myHttpCode = const MyHttpCode()}) {
    _dio = Dio(baseOptionsFunc());
    this.baseConfigFunc(_dio);
  }

  //通用请求
  Future doGet(String url,
      {Map<String, dynamic>? params, Options? options}) async {
    return _requestHttp(url, Method.GET, params: params, options: options);
  }

  Future doPost(String url,
      {Map<String, dynamic>? params, Options? options}) async {
    return _requestHttp(url, Method.POST, params: params, options: options);
  }

  Future doPut(String url,
      {Map<String, dynamic>? params, Options? options}) async {
    return _requestHttp(url, Method.PUT, params: params, options: options);
  }

  Future doPatch(String url,
      {Map<String, dynamic>? params, Options? options}) async {
    return _requestHttp(url, Method.PATH, params: params, options: options);
  }

  Future _requestHttp(String url, Method method,
      {Map<String, dynamic>? params,
      Map<String, dynamic>? headers,
      String mediaType = 'application/json;charset=utf-8',
      options}) {
    final methodName = method.toString().split('.')[1];
    if (method == Method.GET) {
      return _request(
        url,
        methodName,
        params: params,
        header: headers,
        mediaType: mediaType,
        options: options,
      );
    }

    return _request(url, methodName,
        body: params, header: headers, mediaType: mediaType, options: options);
  }

  Future _request(
    String url,
    String method, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    String mediaType = 'application/json; charset=utf-8',
    Options? options,
  }) async {
    Response response;

    final opt = options ?? Options();
    try {
      response = await _dio.request(
        url,
        data: body,
        options: opt.copyWith(
          headers: header,
          method: method.toUpperCase(),
          responseType: ResponseType.json,
          contentType: mediaType,
        ),
        queryParameters: params,
      );
    } on DioError catch (error) {
      print("---------- net error $error");
      throw getHttpErrorResult(error);
    }

    //数据处理
    return baseDataHandleFunc(response, MyHttpCode());
  }

  //Http层网络请求错误翻译
  NetWorkException getHttpErrorResult(DioError e) {
    String? statusMessage;
    int? statusCode;
    if (e.response != null) {
      statusCode = e.response?.statusCode;
      statusMessage = e.response?.statusMessage;
    }
    if (e.type == DioErrorType.connectTimeout) {
      statusMessage = "连接超时";
      statusCode = myHttpCode.errConnTimeout;
    } else if (e.type == DioErrorType.sendTimeout) {
      statusMessage = "请求超时";
      statusCode = myHttpCode.errSendTimeout;
    } else if (e.type == DioErrorType.receiveTimeout) {
      statusMessage = "响应超时";
      statusCode = myHttpCode.errReceTimeout;
    } else if (e.type == DioErrorType.cancel) {
      statusMessage = "请求取消";
      statusCode = myHttpCode.errReqCancel;
    } else {
      statusMessage = "未知错误";
      statusCode = myHttpCode.errUnknown;
    }
    return new NetWorkException(statusCode, statusMessage, data: e);
  }
}

//初始化dio 参数
BaseOptions defaultConfigBaseOptions() {
  return BaseOptions(
      connectTimeout: 3000,
      receiveTimeout: 30000,
      responseType: ResponseType.json);
}

//处理数据
dynamic defaultHandleData(Response response, MyHttpCode defCode) {
  try {
    int intCode = response.data[defCode.respKeyCode];
    if (intCode == defCode.respSuccessCode) {
      //说明是响应成功
      return response.data[defCode.respKeyData];
    }

    String strMsg = response.data[defCode.respKeyMsg];
    throw NetWorkException(intCode, strMsg);
  } catch (error) {
    throw NetWorkException(defCode.errParseJson, "parse json err:$error");
  }
}

//拦截器，针对 请求，响应，错误的通用处理
void defaultConfigDio(Dio dio) {
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: false));
}
