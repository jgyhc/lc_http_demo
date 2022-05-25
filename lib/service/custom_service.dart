import 'package:lc_http_demo/http/service.dart';
import 'package:dio/dio.dart';

const String customServiceKey = "CustomService";

class CustomService extends Service {
  @override
  String serviceKey() {
    return customServiceKey;
  }

  @override
  Map<String, dynamic>? serviceHeader() {
    Map<String, dynamic> header = <String, dynamic>{};
    // header["token"] = "";
    return header;
  }

  @override
  void initDio() {
    //请求头也可以你在这里设置
    dio.options.headers = {
      "Access-Control-Allow-Origin": "*",
    };
    dio.options.baseUrl = "http://v.juhe.cn"; //此处只是默认的baseUrl  可通过路由改变baseUrl

    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 8000;
    // dio.options.contentType = "application/json";
    //这里还可以添加其他插件
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  @override
  Map<String, dynamic> responseFactory(Map<String, dynamic> dataMap) {
    return dataMap;
  }

  String createMessage(List<dynamic> errorVar, String message) {
    String string = message;
    for (var error in errorVar) {
      string = string.replaceFirst("%s", error);
    }
    return string;
  }

  @override
  String errorFactory(DioError error) {
    // 请求错误处理
    String errorMessage = error.message;
    switch (error.type) {
      case DioErrorType.response:
        errorMessage = "服务异常";
        break;
      default:
        errorMessage = "网络错误";
    }
    return errorMessage;
  }
}
