import 'service.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager._internal();
  factory ServiceManager() {
    return _instance;
  }

  ServiceManager._internal() {
    init();
  }

  Map serviceMap = {};

  void init() {}

  void registeredService(Service service) {
    service.initDio();
    String key = service.serviceKey();
    serviceMap[key] = service;
  }

  Service getService(String serviceKey) {
    if (serviceMap.containsKey(serviceKey)) {
      return serviceMap[serviceKey];
    }
    throw Exception('服务尚未注册');
  }
}
