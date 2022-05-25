import 'package:dio/dio.dart';

class Service {
  final Dio dio = Dio();

  late var _baseUrl = "";

  set baseUrl(value) {
    if (_baseUrl == value) {
      return;
    }
    _baseUrl = value;
    dio.options.baseUrl = _baseUrl;
  }

  get baseUrl => _baseUrl;

  Map<String, dynamic>? serviceHeader() {
    return null;
  }

  Map<String, dynamic>? serviceQuery() {
    return null;
  }

  Map<String, dynamic>? serviceBody() {
    return null;
  }

  void initDio() {}

  ///获取到业务数据后的 数据加工
  Map<String, dynamic> responseFactory(Map<String, dynamic> dataMap) {
    return dataMap;
  }

  ///请求错误处理
  String errorFactory(DioError error) {
    String errorMessage = error.message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receive timeout";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Send timeout";
        break;
      case DioErrorType.response:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              errorMessage = "语法错误";
          }
        } on Exception catch (_) {
          errorMessage = error.message;
        }
        break;
      case DioErrorType.other:
        errorMessage = error.message;
        break;
      default:
        errorMessage = error.message;
    }
    return errorMessage;
  }

  String serviceKey() {
    return "";
  }
}
