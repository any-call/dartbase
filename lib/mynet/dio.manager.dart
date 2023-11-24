import 'package:dio/dio.dart';

import 'base.dart';
import 'base.exception.dart';

enum Method { GET, POST, PUT, DELETE, PATH }

///网络请求管理类抽象屋
///负责执行网络请求的通用逻辑

DioManager _instance = DioManager();
DioManager getInstance() => _instance;
typedef Decode<T> = T Function(dynamic);

class DioManager {
  late Dio _dio;
  String _baseUrl = "http://43.227.112.121:18081";

  DioManager() {
    _dio = Dio(configBaseOptions());
    configDio();
  }

  //通用请求
  Future doGet(String url,
      {Map<String, dynamic>? params, Options? options, token}) async {
    return requestHttp(url, Method.GET,
        params: params, options: options, cancelToken: token);
  }

  Future requestHttp(String url, Method method,
      {Map<String, dynamic>? params,
      Map<String, dynamic>? headers,
      String mediaType = 'application/json;charset=utf-8',
      options,
      cancelToken}) {
    final methodName = method.toString().split('.')[1];
    if (method == Method.GET) {
      return request(
        url,
        methodName,
        params: params,
        header: headers,
        mediaType: mediaType,
        cancelToken: cancelToken,
        options: options,
      );
    }

    return request(url, methodName,
        body: params,
        header: headers,
        mediaType: mediaType,
        cancelToken: cancelToken,
        options: options);
  }

  //R是返回类型，T是数据类型
  Future request(
    String url,
    String method, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
    String mediaType = 'application/json; charset=utf-8',
    Options? options,
    cancelToken,
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
      if (isShowLog()) printParams(params ?? body ?? {}, url, header, null);
      print("---------- net error $error");
      throw getHttpErrorResult(error);
    }

    ///打印日志
    if (isShowLog()) printParams(params ?? body ?? {}, url, header, response);
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

  //参数打印
  void printParams(Map<String, dynamic> params, url, headers, response) {
    print("------ url:$url");
    print("------ headers:$headers");

    final pms = params.toString();
    final len = pms.length;
    final res = response == null ? "" : response.data?.toString() ?? "";
    try {
      if (len > 100) {
        int startIndex = 0;
        int endIndex = 100;
        while (true) {
          print("---------- params: ${pms.substring(startIndex, endIndex)}");
          if (endIndex == pms.length) {
            break;
          }
          startIndex = endIndex;
          endIndex += 100;
          if (endIndex > pms.length) {
            endIndex = pms.length;
          }
        }
      } else {
        print("---------- params: $pms");
      }
    } catch (e) {
      print("---------- printLog()打印参数异常----");
    }

    try {
      int length = 1500;
      final len = res.length;
      if (len > length) {
        int startIndex = 0;
        int endIndex = length;
        while (true) {
          print("------------response: ${res.substring(startIndex, endIndex)}");
          if (endIndex == res.length) {
            break;
          }
          startIndex = endIndex;
          endIndex += length;
          if (endIndex > res.length) {
            endIndex = res.length;
          }
        }
      } else {
        print("------------response: $res");
      }
    } catch (e) {
      print("---------- printLog()打印response异常----");
    }
  }

  //初始化dio 参数
  BaseOptions configBaseOptions() {
    return BaseOptions(
        connectTimeout: HttpCode.TIME_OUT,
        receiveTimeout: HttpCode.TIME_OUT,
        baseUrl: _baseUrl,
        responseType: ResponseType.json);
  }

  //dio 配制
  void configDio() {
    _dio.interceptors.add(LogInterceptor(
        requestBody: isShowLog(), responseBody: isShowLog())); //是否开启请求日志
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

  //是否显示log 日志
  bool isShowLog() => false;

  String get baseUrl {
    return _baseUrl;
  }

  set baseUrl(String url) {
    _baseUrl = url;
  }
}
