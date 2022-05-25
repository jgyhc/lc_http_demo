import 'package:flutter/material.dart';
import 'package:lc_http_demo/api/index_api.dart';
import 'package:lc_http_demo/http/service_manager.dart';
import 'package:lc_http_demo/service/custom_service.dart';

void main() {
  runApp(const MyApp());
  //注册服务
  ServiceManager().registeredService(CustomService());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _request() {
    IndexApi api = IndexApi();
    Map<String, dynamic> query = {
      "type": "top",
      "key": "e7298127f641182ecd04828e680ceb55"
    };
    api.request(
        query: query,
        successCallBack: (data) {
          print(data);
        },
        errorCallBack: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: _request, child: const Text("点击我发起一个请求")),
          ],
        ),
      ),
    );
  }
}
