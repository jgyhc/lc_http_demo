import 'package:lc_http_demo/http/base_api.dart';
import 'package:lc_http_demo/service/custom_service.dart';

class IndexApi extends BaseApi {
  @override
  String path() {
    return "/toutiao/index";
  }

  @override
  RequestMethod method() {
    return RequestMethod.get;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}
