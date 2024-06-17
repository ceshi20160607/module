import 'package:dio/dio.dart';

void main(){
  BaseOptions baseOptions = new BaseOptions(
      baseUrl: "http://localhost:9099/"
  );
  Dio dio = new Dio(baseOptions);
  // var ret = dio.get("user/isLogin");
  // print(ret);

  var data = {
    "username": "admin",
    "password": "123123aa",
    "loginType": 0,
    "deviceType": 0
  };
  print(data);
  dio.post("user/doLogin", data: data).then((ret){
    print(ret.data);
  });
}