import 'package:dio/dio.dart';

import 'base.exception.dart';

enum Method { GET, POST, PUT, DELETE, PATH }

typedef BaseOptionsFunc = BaseOptions Function();

class MyDio {
  late Dio _dio;
  BaseOptionsFunc? baseOptionsFunc = _configBaseOptions;

  MyDio() {
    _dio = Dio(baseOptionsFunc!());
    configDio();
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

    //说明网络有数据
    dynamic data;
    //优先解析请求是否出错
    if (!isSuccess(response)) {
      handleFailed(response);
    } else {
      //确保请求成功的情况下，再实例化数据
      data = handleSuccess(response);
    }
    return data;
  }

  //成功数据处理
  dynamic handleSuccess(Response<dynamic> response) {
    try {
      return response.data['data'];
    } catch (e) {
      throw getBusinessErrorResult(
          HttpCode.PARSE_JSON_ERROR, "json parse error 0 ~ $e", null);
    }
  }

  //失败数据处理
  dynamic handleFailed(Response<dynamic> response) {
    if (response.data is Map && response.data["data"] != null) {
      try {
        return response.data["data"];
      } catch (e) {
        throw getBusinessErrorResult(
            HttpCode.PARSE_JSON_ERROR, 'json parse error :$e', null);
      }
    } else {
      throw getBusinessErrorResult(
          getCode(response), getMessage(response), null);
    }
  }

  //dio 配制
  void configDio() {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: false)); //是否开启请求日志
  }

  //判断业务层的返回成功还是失败，失败后报错，成功后进行数据解析
  bool isSuccess(Response response) {
    if (response.data["code"] == HttpCode.SUCCESS) {
      return true;
    }

    return false;
  }

  //若服务器返回的code key不同，重定该方法
  int getCode(Response response) {
    return response.data["code"];
  }

  //若服务器返回的message key不同，重定该方法
  String getMessage(Response response) {
    return response.data["message"];
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
      statusCode = HttpCode.CONNECT_TIMEOUT;
    } else if (e.type == DioErrorType.sendTimeout) {
      statusMessage = "请求超时";
      statusCode = HttpCode.SEND_TIMEOUT;
    } else if (e.type == DioErrorType.receiveTimeout) {
      statusMessage = "响应超时";
      statusCode = HttpCode.RECEIVE_TIMEOUT;
    } else if (e.type == DioErrorType.cancel) {
      statusMessage = "请求取消";
      statusCode = HttpCode.REQUEST_CANCEL;
    } else {
      statusMessage = "未知错误";
      statusCode = HttpCode.UNKNOWN_NET_ERROR;
    }
    return new NetWorkException(statusCode, statusMessage, data: e);
  }

  //业务逻辑报错映射
  NetWorkException getBusinessErrorResult<T>(int code, String error, T data) =>
      NetWorkException(code, error, data: data);
}

//初始化dio 参数
BaseOptions _configBaseOptions() {
  return BaseOptions(
      connectTimeout: HttpCode.TIME_OUT,
      receiveTimeout: HttpCode.TIME_OUT,
      responseType: ResponseType.json);
}
